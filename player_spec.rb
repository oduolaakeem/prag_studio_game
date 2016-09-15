require_relative 'spec_helper'
require_relative 'player'

# The describe method defines an example group, which takes the name of
# the group as string or as a class name.
describe Player do
  before do
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
    $stdout = StringIO.new
  end

  # The it method defines a code example, and generally you want to use
  # a string that expresses the behavior your're expecting.
  it "has a capitalized name" do
    #@player.name.should == "Larry"
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    #@player.health.should == 150
    expect(@player.health).to eq(150)
  end

  it "has a string representation" do
    #@player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
    expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
  end

  it "computes a score as the sum of its health and length of name" do
    #@player.score.should == (@initial_health + 5)
    expect(@player.score).to eq(@initial_health + 5)
  end    

  it "increases health by 15 when w00ted" do
    @player.w00t

    #@player.health.should == (initial_health + 15)
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do
    @player.blam

    #@player.health.should == (initial_health - 10)
    expect(@player.health).to eq(@initial_health - 10)
  end

  context "with a health greater than 100" do
    before do
      @initial_health = 150
      @player = Player.new("larry", @initial_health)
    end

    it "is strong" do
      #expect(@player.strong?).to eq(true)
      #expect(@player.strong?).to be_truthy
      expect(@player).to be_strong
    end
  end

  context "with a health of 100 or less" do
    before do
      @initial_health = 100
      @player = Player.new("larry", @initial_health)
    end

    it "is wimpy" do
      #expect(@player).to_not be_strong
      expect(@player).not_to be_strong
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end

end