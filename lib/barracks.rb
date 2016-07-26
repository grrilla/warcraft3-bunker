class Barracks

  class InsufficientResourcesError < StandardError
  end

  attr_reader :gold, :food, :lumber, :health_points

  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
  end

  def can_train_footman?
    self.gold >= 135 && self.food >= 2
  end

  def train_footman
    raise InsufficientResourcesError, 'Not enough resources to build Footman!' if !can_train_footman?
    @gold -= 135
    @food -= 2
    Footman.new
  end

  def can_train_peasant?
    self.gold >= 90 && self.food >= 5
  end

  def train_peasant
    raise InsufficientResourcesError, 'Not enough resources to build Peasant!' if !can_train_peasant?
    @gold -= 90
    @food -= 5
    Peasant.new
  end

  def can_train_siege_engine?
    self.gold >= 200 && self.lumber >= 60 && self.food >= 3
  end

  def train_siege_engine
    raise InsufficientResourcesError, 'Not enough resources to build Siege Engine!' if !can_train_siege_engine?
    @gold -= 200
    @lumber -= 60
    @food -= 3
    SiegeEngine.new
  end

  def damage(attacker)
    if attacker.is_a? Footman
      @health_points -= (attacker.attack_power.to_f / 2).ceil.to_i
    elsif attacker.is_a? SiegeEngine
      @health_points -= attacker.attack_power * 2
    else
      @health_points -= attacker.attack_power
    end
  end

  def dead?
    health_points <= 0
  end
end
