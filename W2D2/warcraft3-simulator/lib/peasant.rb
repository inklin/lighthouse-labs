class Peasant
  attr_reader :health_points, :attack_power

  def initialize
    @health_points = 35
    @attack_power = 0
  end

  def self.food_cost
    5
  end

  def self.gold_cost
    90
  end
end