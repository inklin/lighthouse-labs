# http://classic.battle.net/war3/human/units/footman.shtml
class Footman < Unit
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
    if enemy.is_a? Barracks
      damage_amount = (self.attack_power.to_f / 2).ceil
      enemy.damage(damage_amount)
    else
      super(enemy)
    end
  end
end
