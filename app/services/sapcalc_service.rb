class SapcalcService
  KOH = 1
  NAOH = 1.403

  def initialize(type=KOH)
    @type = type
  end

  def calculate_oil(sap_value, weight)
    return (sap_value / @type) * weight
  end

  def calculate_oils(oils)
    return oils.map{|oil| self.calculate_oil(oil[:sap], oil[:weight])}.reduce(0, :+)
  end
end
