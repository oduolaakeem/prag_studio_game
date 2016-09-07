# Player 1: Larry
name1 = "larry"
health1 = 60
puts "#{name1.capitalize} has a health of #{health1}."

# Player 2: Curly
name2 = "curly"
health2 = 125
puts "#{name2.upcase} has a health of #{health2}."

health2 = health1
puts "#{name2.upcase} has a health of #{health2}."

health1 = 30
puts "#{name1.capitalize} has a health of #{health1}."
puts "#{name2.upcase} has a health of #{health2}."

# Player #3: Moe
name3 = "moe"
health3 = 100
puts "#{name3.capitalize} has a health of #{health3}.".center(50, "*")

# Player #4: Shemp
name4 = "shemp"
health4 = 90
puts "#{name4.capitalize.ljust(30, ".")} #{health4} health"

# Reverse It
number = 123
reversed_number = number.to_s.reverse.to_i
puts reversed_number

# Time Method
current_time = Time.new
puts "The game started on #{current_time.strftime("%A %m/%d/%Y at %I:%M%p")}"