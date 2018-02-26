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

  def calculate_oils(oils)
    return oils.map{|oil| self.calculate_oil(oil[:sap], oil[:weight])}.reduce(0, :+)
  end
end
