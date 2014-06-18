load 'number.rb'
load 'C_code_generator.rb'

class Test
	@test_difficulty

	def initialize(dif)
		@test_difficulty = dif
	end

	def generate_tests
		task_type_1
	end

	# 6- 7 tipa zada4i

	def task_type_1
		orig = Number.new(@test_difficulty, 4)
		orig.generate_random_hex_num
		puts orig.print_number

		insert = Number.new(@test_difficulty, 4)
		insert.generate_random_hex_num
		puts insert.print_number

		shift = rand(6...8)
		a = "orig | (insert << #{shift})"

		code = "int orig = 0x#{orig.convert_num_to_string};\nint insert = 0x#{insert.convert_num_to_string};\nint a = #{a};\nprintf(\"%d\", a);"
	
		converter = C_code_generator.new(code)
		converter.create_C_file
	end
	
	def task_type_2

	end

	def task_type_3

	end

	def task_type_4

	end

	def task_type_5

	end
end
