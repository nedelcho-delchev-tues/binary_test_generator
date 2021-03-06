load 'number.rb'
load 'code_generator.rb'

class Test
	@test_id
	@test_difficulty

	def initialize(id,dif)
		@test_id = id
		@test_difficulty = dif
		@converter = Code_generator.new(@test_id) 
		#@converter.delete_txt # Delete txt before new test... Just for now
	end

	def generate_tests
		task_type_1 # 1 
		task_type_1 # 2
		task_type_2 # 3
		task_type_2 # 4
		task_type_2 # 5
		task_type_3 # 6
		task_type_4 # 7
		task_type_5 # 8
		task_type_6 # 9
		task_type_7 # 10
		task_type_5 # 11
		task_type_5 # 12
	end

	# Task 1, 2	
	def task_type_1
		orig = Number.new(@test_difficulty, 4)
		orig.generate_random_hex_num

		insert = Number.new(@test_difficulty, 4)
		insert.generate_random_hex_num

		shift = rand(6...8)
		a = "orig | (insert << #{shift})"

		code = "int orig = 0x#{orig.convert_num_to_string};\nint insert = 0x#{insert.convert_num_to_string};\nint a = #{a};\nprintf(\"%d\\n\", a);"
		
		@converter.set_code(code)
		@converter.create_C_file
		@converter.convert
	end
	
	# Task 3, 4, 5
	def task_type_2
		orig = Number.new(@test_difficulty, 4)
		orig.generate_random_hex_num

		insert = Number.new(@test_difficulty, 4)
		insert.generate_random_hex_num

		shift = rand(6...8)
		a = "orig | (insert << #{shift})"
		shift = rand(6...8)
		b = "orig | (insert << #{shift})"
		
		operation = random_operation
		result = "a #{operation} b"

		code = "int orig = 0x#{orig.convert_num_to_string};\nint insert = 0x#{insert.convert_num_to_string};\nint a = #{a};\nint b = #{b};\nint result = #{result};\nprintf(\"%d\\n\", result);"
	
		@converter.set_code(code)
		@converter.create_C_file
		@converter.convert
	end

	# Task 6
	def task_type_3
		i = Number.new(@test_difficulty, 4)
		i.generate_random_hex_num

		random = rand(10)
		operation = random_operation
		left = "0x#{i.convert_num_to_string} #{operation} (1 << #{random})"
		code = "int i = 0x#{i.convert_num_to_string};\nint left = #{left};\nprintf(\"%d\\n\", left);"

		@converter.set_code(code)
		@converter.create_C_file
		@converter.convert
	end

	# Task 7
	def task_type_4
		value1 = Number.new(@test_difficulty, 8)
		value1.generate_random_hex_num

		value2 = Number.new(@test_difficulty, 8)
		value2.generate_random_hex_num

		shift = rand(2..4)
		shift2 = rand(2..4)
		operation = random_operation
		result = "(value1 << #{shift}) #{operation} (value2 >> #{shift2})"

		code = "long value1 = 0x#{value1.convert_num_to_string};\nlong value2 = 0x#{value2.convert_num_to_string};\nlong result = #{result};\nprintf(\"%ld\\n\", result);"

		@converter.set_code(code)	
		@converter.create_C_file
		@converter.convert
	end

	# Task 8, 11, 12
	def task_type_5
		value1 = rand(128..512)
		value2 = rand(128..512)

		shift = rand(2..4)
		shift2 = rand(2..4)
		operation = random_operation

		result = "(value1 << #{shift}) #{operation} (value2 >> #{shift})"
		code = "int value1 = #{value1};\nint value2 = #{value2};\nint result = #{result};\nprintf(\"%d\\n\", result);"

		@converter.set_code(code)
		@converter.create_C_file
		@converter.convert
	end

	# Task 9
	def task_type_6
		testValue = Number.new(@test_difficulty, 8)
		testValue.generate_random_hex_num

		shift = rand(2..4)
		operation = random_operation
		condition = "if(testValue #{operation} (1 << #{shift}))"

		code = "long testValue = 0x#{testValue.convert_num_to_string};\nint a = 0;\n#{condition}{\na = 1;\n}else{\na = 2;\n}\nprintf(\"%d\\n\", a);"

		@converter.set_code(code)
		@converter.create_C_file
		@converter.convert
	end

	# Task 10
	def task_type_7
		testValue = Number.new(@test_difficulty, 8)
		testValue.generate_random_hex_num

		shift = rand(2..4)
		operation = random_operation
		condition = "if((result = testValue & testValue ^ testValue | (1 << #{shift})))"

		code = "long testValue = 0x#{testValue.convert_num_to_string};\nint a = 0;\nint result = 0;\n#{condition}{\na = 1;\n}else{\na = 2;\n}\nprintf(\"%d\\n\", a);"

		@converter.set_code(code)
		@converter.create_C_file
		@converter.convert
	end

	def random_operation
		random = rand(3) 
		operation = ("&" if random == 0) || ("|" if random == 1) || "^"
		return operation
	end
end
