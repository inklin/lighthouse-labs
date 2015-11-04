class Barracks
  attr_reader :health_points, :lumber, :food, :gold

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def can_train_footman?
    self.food >= Footman.food_cost && self.gold >= Footman.gold_cost
  end

  def train_footman
    if can_train_footman?
      @gold -= Footman.gold_cost
      @food -= Footman.food_cost
      Footman.new
    end
  end

  def can_train_peasant?
    self.food >= Peasant.food_cost && self.gold >= Peasant.gold_cost
  end

  def train_peasant
    if can_train_peasant?
      @gold -= Peasant.gold_cost
      @food -= Peasant.food_cost
      Peasant.new
    end
  end

  def build_seige_engine
    @gold -= SeigeEngine.gold_cost
    @food -= SeigeEngine.food_cost
    @lumber -= SeigeEngine.lumber_cost
  end

  def damage(ap)
    @health_points -= ap
  end
end
