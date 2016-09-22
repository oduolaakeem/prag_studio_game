require 'pp'

letters = { "c"=>3, "e"=>1, "l"=>1, "n"=>1, "t"=>1, "x"=>8, "y"=>4 }

# score = "excellently".each_char.reduce(0) { |sum, char| sum + letters[char] } 
# or
score = 0
"excellently".each_char { |c| score += letters[c] }
#=> 23
#   e x c e l l e n t l y
#   1 8 3 1 1 1 1 1 1 1 4
pp score

point_totals = Hash.new(0)
"excellently".each_char { |c| point_totals[c] += letters[c] }
pp point_totals

# score = point_totals.reduce(0) { |sum, point| pp point; sum += point[1] }
# or
score = point_totals.values.reduce(0, :+)
pp score