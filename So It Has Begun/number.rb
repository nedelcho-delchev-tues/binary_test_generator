
class Number
	@number
	@difficulty
	@num_to_string

	def initialize(dif, num_length)
		@number = Array.new(num_length)
		@difficulty = dif
	end

	def generate_random_hex_num
		if @difficulty == "easy"
			rand_num_easy
		else @difficulty == "hard"
			rand_num_hard
		end

		convert_num_to_string
	end

	def rand_num_easy
		@number.each_index do |el|
			@number[el] = rand(10...16).to_s(16)
		end
		@number[rand(0...@number.length)] = 0
		@number[rand(0...@number.length)] = 0
	end

	def rand_num_hard
		@number.each_index do |el|
			@number[el] = rand(16).to_s(16)
		end
	end

	def convert_num_to_string
		@num_to_string = [@number].join 
	end

	def print_number()
		puts @num_to_string
	end
end
