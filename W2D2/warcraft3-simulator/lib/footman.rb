# http://classic.battle.net/war3/human/units/footman.shtml
class Footman < Unit
  GOLD_COST = 135
  FOOD_COST = 2

  def initialize
    # health points, attack_power
    super(60, 10)
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
