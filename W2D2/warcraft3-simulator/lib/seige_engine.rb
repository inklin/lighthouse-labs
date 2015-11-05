class SeigeEngine < Unit
  LUMBER_COST = 60
  FOOD_COST = 3
  GOLD_COST = 200

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage(attack_power * 2)
    elsif enemy.is_a? SeigeEngine
      super(enemy)
    end
  end

end