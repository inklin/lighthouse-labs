class Barracks
  attr_reader :health_points, :lumber, :food, :gold

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def can_train_footman?
    food >= Footman::FOOD_COST && gold >= Footman::GOLD_COST
  end

  def train_footman
    if can_train_footman?
      @gold -= Footman::GOLD_COST
      @food -= Footman::FOOD_COST
      Footman.new
    end
  end

  def can_train_peasant?
    food >= Peasant::FOOD_COST && gold >= Peasant::GOLD_COST
  end

  def train_peasant
    if can_train_peasant?
      @gold -= Peasant::GOLD_COST
      @food -= Peasant::FOOD_COST
      Peasant.new
    end
  end

  def build_seige_engine
    @gold -= SeigeEngine::GOLD_COST
    @food -= SeigeEngine::FOOD_COST
    @lumber -= SeigeEngine::LUMBER_COST
  end

  def damage(ap)
    @health_points -= ap
  end
end
