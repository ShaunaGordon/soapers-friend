require 'rails_helper'

# The SAP value of oils is the ratio of KOH (Potassium Hydroxide)
# to oil needed to saponify (turn to soap) the entire amount of oil
# So, 100g of oil with a SAP value of 0.18 requires 18g of KOH
RSpec.describe SapcalcService, type: :service do
  context 'is calculating KOH' do
    subject(:calculator) { SapcalcService.new }

    it 'calculates KOH for a single oil' do
      # Take SAP value, Weight
      # Return value for KOH (default)
      sap = 0.18
      weight = 100
      result = calculator.calculate_oil(sap_value: sap, weight: weight)

      expect(result).to eq(sap * weight)
    end

    it 'calculates total KOH for multiple oils' do
      # Most soaps consist of multiple oils, and each has its own SAP value.
      # Therefore, we need to be able to calculate them all, quickly and easily.
      oils = [
        {
          :sap => 0.18,
          :weight => 100
        },
        {
          :sap => 0.135,
          :weight => 100
        }
      ]
      result = calculator.calculate_oils(oils: oils)

      expect(result).to eq((oils[0][:sap] * oils[0][:weight]) + (oils[1][:sap] * oils[1][:weight]))
    end
  end

  context 'is calculating NaOH' do
    subject(:calculator) { SapcalcService.new(lye_type: SapcalcService::NAOH) }

    it 'calculates NaOH for a single oil' do
      # Sodium hydroxide (NaOH) requires a different amount to saponify
      # all of the oil. Therefore, we need to apply a modifier to account
      # for that. Since it's consistent throughout the process, we can
      # tell it which we need at the creation level.

      # Indicate NaOH (sodium hydroxide)
      # Take SAP value, Weight
      # Return appropriate value ((0.18/1.403) * 100)
      # To convert KOH values to NaOH values, divide the KOH values by the
      # ratio of the molecular weights of KOH and NaOH (1.403).
      sap = 0.18
      weight = 100
      modifier = 1.403
      result = calculator.calculate_oil(sap_value: sap, weight: weight)

      expect(result).to eq((sap/modifier) * weight)
    end

    it 'calculates total NaOH for multiple oils' do
      oils = [
        {
          :sap => 0.18,
          :weight => 100
        },
        {
          :sap => 0.135,
          :weight => 100
        }
      ]
      modifier = 1.403
      calculator = SapcalcService.new(lye_type: SapcalcService::NAOH)
      result = calculator.calculate_oils(oils: oils)

      expect(result).to eq(((oils[0][:sap]/modifier) * oils[0][:weight]) + ((oils[1][:sap]/modifier) * oils[1][:weight]))
    end
  end

  context 'is calculating lye reduction' do
    it 'calculates non-zero lye reduction for oils' do
      # To make soap not strip *all* of the oils off one's skin,
      # a lye reduction (also known as super-fatting) is required.
      # In cold process, this results in some of the oils not being
      # saponified into soap. Unfortunately, we have no control over
      # which ones, and we can only reduce the amount of lye we use in
      # the batch and let the chemical process "determine" what fatty acids
      # are not turned to soap. (Hot process can add a certain amount of oil
      # of the soaper's choice to obtain the desired superfat.) Also, this
      # generally only applies to NaOH (bar) soaps, because you don't want
      # oils suspended in your liquid soap.
      # Since this is set on a per-batch basis, based on a number of factors
      # unique to the batch and the soap maker, we'll default to 0 and allow
      # the value to be set on init.

      nonreduced_lye = 10.5
      reduction = 0.05 # 5% lye reduction, a common scenario
      calculator = SapcalcService.new(lye_reduction: reduction)

      result = calculator.calculate_lye_reduction(nonreduced_lye: nonreduced_lye)

      # Let's go back to math class, kids!
      # Percentage formula:
      # X is Y% of Z
      # We set up the lye reduction as the decimal reduction (ie - 5% = 0.05).
      # What we really want, though, is the remaining percentage (ie - 95%),
      # so we need to invert the number (hence 1 - 0.05)
      expect(result).to eq(nonreduced_lye * (1 - reduction))
    end

    it 'correctly calculates zero lye reduction' do
      nonreduced_lye = 10.5
      # zero's the default
      calculator = SapcalcService.new

      result = calculator.calculate_lye_reduction(nonreduced_lye: nonreduced_lye)

      # No reduction should result in our original value
      expect(result).to eq(nonreduced_lye)
    end

    subject(:calculator) { SapcalcService.new }
    context 'is invalid nonreduced lye value' do
      it 'throws invalid type error' do
        expect { calculator.calculate_lye_reduction(nonreduced_lye: 'foo') }.to raise_error(ArgumentError)
      end
    end

    context 'is valid string lye value' do
      it 'accepts float numeric string' do
        expect { calculator.calculate_lye_reduction(nonreduced_lye: '10.5') }.to_not raise_error
      end

      it 'accepts integer numeric string' do
        expect { calculator.calculate_lye_reduction(nonreduced_lye: '10') }.to_not raise_error
      end
    end
  end

  context 'is invalid input' do
    context 'is invalid lye type' do
      it 'throws invalid type error' do
        # There are only two types of Lye used in soap making, KOH and NaOH
        # Anything else is an error
        expect { SapcalcService.new(lye_type: 'foo') }.to raise_error(ArgumentError)
      end
    end

    context 'is invalid lye reduction value' do
      it 'throws invalid type error' do
        # There are only two types of Lye used in soap making, KOH and NaOH
        # Anything else is an error
        expect { SapcalcService.new(lye_reduction: 'foo') }.to raise_error(ArgumentError)
      end
    end
  end

  it 'accepts float numeric string' do
    expect { SapcalcService.new(lye_reduction: '1.1') }.to_not raise_error
  end

  it 'accepts integer numeric string' do
    expect { SapcalcService.new(lye_reduction: '1') }.to_not raise_error
  end

  it 'accepts integer' do
    expect { SapcalcService.new(lye_reduction: 1) }.to_not raise_error
  end
end
