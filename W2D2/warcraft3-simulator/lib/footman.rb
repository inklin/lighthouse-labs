# http://classic.battle.net/war3/human/units/footman.shtml
class Footman < Unit
  attr_accessor :health_points

  def initialize
    # health points, attack_power
    super(60, 10)
  end

  def self.gold_cost
    135 
  end

  def self.food_cost
    2
  end

  def attack!(enemy)
    if enemy.class.name == "Barracks"
      barrack_damage = (self.attack_power.to_f / 2).ceil
      enemy.damage(barrack_damage) unless cannot_attack?(enemy)
    else
      enemy.damage(self.attack_power) unless cannot_attack?(enemy)
    end
  end

  def cannot_attack?(enemy)
    dead? || enemy.dead?
  end
end
