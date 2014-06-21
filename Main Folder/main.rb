load 'number.rb'
load 'test.rb' 

number_of_tests = ARGV[0]
difficulty = ARGV[1]

if number_of_tests == nil
	number_of_tests = 1
end

if difficulty == nil
	difficulty = "easy"
end

number_of_tests.to_i.times do |i|
	test = Test.new(i+1, difficulty)
	test.generate_tests
end
