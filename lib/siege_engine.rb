require_relative 'unit'

class SiegeEngine < Unit

  def initialize
    super(400,50)
  end

  def attack!(target)
    raise InvalidUnitActionError, 'Siege Engines can only target structures!' if target.is_a? Unit
    super
  end

end
