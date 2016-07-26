class Unit

  class InvalidUnitActionError < StandardError
  end

  attr_reader :health_points, :attack_power

  def initialize(health_points,attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    raise InvalidUnitActionError, 'Dead units cannot attack!' if self.dead?
    raise InvalidUnitActionError, 'Cannot attack dead units!' if enemy.dead?
    enemy.damage(self)
  end

  def damage(attacker)
    @health_points -= attacker.attack_power
  end

  def dead?
    @health_points <= 0
  end

end
