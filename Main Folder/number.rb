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
		# B, D, F
		random = rand(3) 
		num = ("B" if random == 0) || ("D" if random == 1) || "F"

		@number.each_index do |el|
			@number[el] = num
		end

		@number.length/2.times do 
			@number[rand(0...@number.length)] = 0
		end
	end

	def rand_num_hard
		@number.each_index do |el|
			@number[el] = rand(16).to_s(16).upcase
		end
	end

	def convert_num_to_string
		@num_to_string = [@number].join
		return @num_to_string
	end

	def print_number
		puts @num_to_string
	end
end
