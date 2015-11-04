class SeigeEngine < Unit
  @@lumber_cost = 60

  def initialize
    super(400, 50)
  end

  def self.lumber_cost
    @@lumber_cost
  end

  def self.food_cost
    3
  end

  def self.gold_cost
    200
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage(self.attack_power * 2)
    elsif enemy.is_a? SeigeEngine
      super(enemy)
    end
  end

end