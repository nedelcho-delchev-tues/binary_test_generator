load 'number.rb'
load 'test.rb' 

number_of_test = ARGV[0]
difficulty = ARGV[1]

num = Number.new(difficulty, 4)
num.generate_random_hex_num
puts num.print_number

#puts "Number of Tests = #{number_of_test}"
#puts "Difficulty =  #{difficulty}"
