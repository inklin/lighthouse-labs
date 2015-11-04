class Barracks
  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    self.food >= 2 && self.gold >= 135
  end

  def train_footman
    gold_cost = 135
    food_cost = 2

    if can_train_footman?
      @gold -= gold_cost
      @food -= food_cost
      Footman.new
    end
  end

  def can_train_peasant?
    self.food >= 5 && self.gold >= 90
  end

  def train_peasant
    if can_train_peasant?
      gold_cost = 90
      food_cost = 5
      @gold -= gold_cost
      @food -= food_cost
      Peasant.new
    end
  end
end
