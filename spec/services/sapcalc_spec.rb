require 'rails_helper'

RSpec.describe SapcalcService, type: :service do
  # The SAP value of oils is the ratio of KOH (Potassium Hydroxide)
  # to oil needed to saponify (turn to soap) the entire amount of oil
  # So, 100g of oil with a SAP value of 0.18 requires 18g of KOH
  describe '#calculate' do
    it 'calculates KOH for a single oil' do
      # Take SAP value, Weight
      # Return value for KOH (default)
      sap = 0.18
      weight = 100
      calculator = SapcalcService.new()
      result = calculator.calculate_oil(sap, weight)

      expect(result).to eq(sap * weight)
    end

    it 'calculates NaOH for a single oil' do
      # Indicate NaOH (sodium hydroxide)
      # Take SAP value, Weight
      # Return appropriate value ((0.18/1.403) * 100)
      # To convert KOH values to NaOH values, divide the KOH values by the
      # ratio of the molecular weights of KOH and NaOH (1.403).
      sap = 0.18
      weight = 100
      modifier = 1.403
      calculator = SapcalcService.new('NaOH')
      result = calculator.calculate_oil(sap, weight)

      expect(result).to eq((sap/modifier) * weight)
    end
  end
end
