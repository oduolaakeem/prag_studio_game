require_relative 'spec_helper'
require_relative 'game'
require_relative 'die'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)

    $stdout = StringIO.new
  end

  it "w00ts the player if a high number is rolled" do
    #Die.any_instance.stub(:roll).and_return(5)
    allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @game.play(2)

    expect(@player.health).to eq(@initial_health + (15 * 2))
  end

  it "skips the player if a medium number is rolled" do
    #Die.any_instance.stub(:roll).and_return(3)
    allow_any_instance_of(Die).to receive(:roll).and_return(3)

    @game.play(2)

    expect(@player.health).to eq(@initial_health)
  end

  it "blam the player if a low number is rolled" do
    #Die.any_instance.stub(:roll).and_return(1)
    allow_any_instance_of(Die).to receive(:roll).and_return(1)

    @game.play(2)

    expect(@player.health).to eq(@initial_health - (10 * 2))
  end

end