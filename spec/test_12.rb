require_relative 'spec_helper'

describe Unit do

  before :each do
    @live_man = Unit.new(20,20)
    @dead_man = Unit.new(0,20)
  end

  it 'should not be able to attack if it is dead' do
    expect {
      @dead_man.attack!(@live_man)
    }.to raise_error Unit::InvalidUnitActionError, "Dead units cannot attack!"
  end

  it 'should not be able able to attack if target is dead' do
    expect {
      @live_man.attack!(@dead_man)
    }.to raise_error Unit::InvalidUnitActionError, "Cannot attack dead units!"
  end

end
