require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'pp'
require 'csv'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES
    puts "\nTheere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      if block_given?
        # Exit the game if the block indicates so
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)      
        puts player
      end
    end
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |player| player.strong? }

    puts "\n#{@title} Statistics:"

    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      print_name_and_health(player)
    end

    print_high_scores

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end

  def load_players(from_file)
    #File.readlines(from_file).each do |line|
      #add_player(Player.from_csv(line))
    CSV.foreach(from_file) do |row|
      player = Player.new(row[0], Integer(row[1]))
      add_player(player)
    end
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      print_high_scores(file)
    end
  end

  private

    def print_name_and_health(player)
      puts "#{player.name} (#{player.health})"
    end

    def high_score_entry(player)
      formatted_name = player.name.ljust(20, ".")
      "#{formatted_name} #{player.score}"
    end

    def print_high_scores(file=$stdout)
      prefix = "\n" if file == $stdout
      file.puts "#{prefix}#{@title} High Scores:"
      @players.sort.each do |player|
        file.puts high_score_entry(player)
      end
    end      

end