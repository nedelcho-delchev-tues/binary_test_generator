load 'number.rb'
load 'test.rb' 

number_of_test = ARGV[0]
difficulty = ARGV[1]

test = Test.new(difficulty)
test.generate_tests
