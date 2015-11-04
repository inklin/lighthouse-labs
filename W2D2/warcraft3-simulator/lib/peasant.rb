class Peasant
  attr_reader :health_points, :attack_power

  FOOD_COST = 5
  GOLD_COST = 90

  def initialize
    @health_points = 35
    @attack_power = 0
  end
end