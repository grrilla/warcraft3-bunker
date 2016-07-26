require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it 'should have 500hp that can be read' do
    expect(@barracks.health_points).to eq(500)
  end

  it 'should take only half damage from Footman instances' do
    Footman.new.attack!(@barracks)
    expect(@barracks.health_points).to eq(495)
  end

end
