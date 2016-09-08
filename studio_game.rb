class Player
  attr_accessor :name  
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end
end

player1 = Player.new("moe")
puts player1.inspect
puts player1
player1.blam
puts player1

player2 = Player.new("larry", 60)
puts player2
player2.w00t
puts player2
player2.name = "lawrance"
puts player2.name

player3 = Player.new("curly", 125)
puts player3
player3.blam
puts player3
player3.w00t
puts player3

puts player1.health
puts player2.health
puts player3.health