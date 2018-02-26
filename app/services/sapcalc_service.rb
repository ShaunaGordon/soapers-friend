class SapcalcService
  KOH = 1
  NAOH = 1.403

  def initialize(lye_type: KOH, lye_reduction: 0.0)
    @lye_type_modifier = lye_type
    @lye_reduction = lye_reduction
  end

  def calculate_oil(sap_value:, weight:)
    return (sap_value / @lye_type_modifier) * weight
  end

  def calculate_oils(oils:)
    return oils
          .map{|oil| self.calculate_oil(
                      sap_value: oil[:sap],
                      weight: oil[:weight]
                     )
          }
          .reduce(0, :+)
  end

  def calculate_lye_reduction(nonreduced_lye:)
    # Let's go back to math class, kids!
    # Percentage formula:
    # X is Y% of Z
    # We set up the lye reduction as the decimal reduction (ie - 5% = 0.05).
    # What we really want, though, is the remaining percentage (ie - 95%),
    # so we need to invert the number (hence 1 - 0.05)
    return nonreduced_lye * (1 - @lye_reduction)
  end
end
