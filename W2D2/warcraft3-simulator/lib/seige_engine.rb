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
    type = enemy.class.name

    case type
    when "Barracks"
      enemy.damage(self.attack_power * 4)
    when "SeigeEngine"
      enemy.damage(self.attack_power)
    end

  end

end