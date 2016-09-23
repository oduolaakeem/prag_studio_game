require_relative 'player'
require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 95)
player3 = Player.new("curly", 105)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(10) do
  knuckleheads.total_points >= 2_000
end
knuckleheads.print_stats