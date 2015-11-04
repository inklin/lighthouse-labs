class Unit
  attr_reader :health_points
  attr_reader :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def damage(ap)
    @health_points -= ap
  end

  def attack!(enemy_unit)
    enemy_unit.damage(self.attack_power)
  end
end