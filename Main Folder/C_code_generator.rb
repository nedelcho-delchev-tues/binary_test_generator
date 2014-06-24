class C_code_generator
	@begining_of_C_file
	@ending_of_C_file
	@essential_code
	@test_id
	@all_tasks

	def initialize(id_of_test)
		@begining_of_C_file = 
		"#include <stdio.h>\nint main(){"

		@ending_of_C_file = 
		"return 0;\n}"

		@essential_code = ""

		@test_id = id_of_test

		@all_tasks = ''
	end

	def set_code(code)
		@essential_code = code
	end

	def create_C_file
		write_in_file
		run_C_file
	end

	def write_in_file
		File.open("test_code.c", "w") do |file| 
			file.write("#{@begining_of_C_file}\n#{@essential_code}\n#{@ending_of_C_file}")
		end
	end

	def run_C_file
		system("gcc test_code.c");
		result = system("./a.out >> tests/test_#{@test_id}_results.txt");
	end

	def delete_txt
		data_file = "tests/test_#{@test_id}.txt"
		File.open(File.expand_path(data_file), "w") do |file|
			file << ""
		end

		data_file = "tests/test_#{@test_id}_results.txt"
		File.open(File.expand_path(data_file), "w") do |file|
			file << ""
		end
	end

	def write_in_txt
		@all_tasks += @essential_code.split("printf")[0]
		#parsed_string = @all_tasks
		data_file = "tests/test_#{@test_id}.html"
		File.open(File.expand_path(data_file), "a") do |file|
			file << @all_tasks
			#file << @essential_code.split("printf")[0]
		end

	end
end
