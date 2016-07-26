require_relative "spec_helper"

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it 'should be an instance of its own class, inheriting from Unit' do
    expect(@siege_engine).to be_an_instance_of SiegeEngine
    expect(@siege_engine).to be_a Unit
  end

  it 'should have 50 AP and 400 HP' do
    expect(@siege_engine.health_points).to eq 400
    expect(@siege_engine.attack_power).to eq 50
  end

  describe "#attack!" do
    it 'should not be able to attack non-building units' do
      expect {
        @siege_engine.attack!(Footman.new)
      }.to raise_error Unit::InvalidUnitActionError, 'Siege Engines can only target structures!'
    end
  end
end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it 'should have lumber included among its resources' do
    expect(@barracks.lumber).to be > 0
  end

  it 'should not be able to build a SiegeEngine if it lacks a required resource' do
    expect(@barracks).to receive(:can_train_siege_engine?).and_return(false)
    expect {
      @barracks.train_siege_engine
    }.to raise_error Barracks::InsufficientResourcesError, 'Not enough resources to build Siege Engine!'
  end

  it 'should cost 200 gold, 60 lumber, 3 food to build a siege tank' do
    expect([@barracks.gold, @barracks.lumber, @barracks.food]).to match_array [1000,500,80]
    expect(@barracks.train_siege_engine).to be_an_instance_of SiegeEngine
    expect([@barracks.gold, @barracks.lumber, @barracks.food]).to match_array [800,440,77]
  end

  it 'should take double damage from a SiegeEngine' do
    expect {
      SiegeEngine.new.attack!(@barracks)
    }.to change{@barracks.health_points}.by -100
  end
end
