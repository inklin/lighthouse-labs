class Unit
  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def damage(ap)
    @health_points -= ap
  end

  def dead?
    health_points <= 0
  end

  def attack!(enemy)
    enemy.damage(attack_power) unless cannot_attack?(enemy)
  end

  private

  def cannot_attack?(enemy)
    dead? || enemy.dead?
  end
end