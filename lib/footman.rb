# http://classic.battle.net/war3/human/units/footman.shtml

require_relative 'unit.rb'

class Footman < Unit

  def initialize
    super(60,10)
  end

  def attack!(enemy)
    enemy.damage(self.attack_power)
  end

  def damage(attack)
    @health_points -= attack
  end

end
