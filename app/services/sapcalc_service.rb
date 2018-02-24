class SapcalcService
  def initialize(type='KOH')
    modifiers = {
      'koh' => 1,
      'naoh' => 1.403
    }

    @type = modifiers[type.downcase]
  end

  def calculate_oil(sap_value, weight)
    return (sap_value / @type) * weight
  end
end
