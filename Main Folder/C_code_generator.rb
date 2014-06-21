class C_code_generator
	@begining_of_C_file
	@ending_of_C_file
	@essential_code

	def initialize(code)
		@begining_of_C_file = 
		"#include <stdio.h>\nint main(){"

		@ending_of_C_file = 
		"\n\treturn 0;\n}"

		@essential_code = code
	end

	def create_C_file
		write_in_file
		run_C_file
		#get_result
	end

	def write_in_file
		File.open("test_code.c", "w") do |file| 
			file.write("#{@begining_of_C_file}\n#{@essential_code}\n#{@ending_of_C_file}")
		end
	end

	def run_C_file
		system("gcc test_code.c");
		result = system("./a.out >> test_results.txt");
	end

	def get_result
		result = 0
		f = File.open("test_results.txt", "r")
		f.each_line do |line|
			result = line
		end
		f.close
		result = result.to_i.to_s(16)
		puts result
	end

	def delete_txt
		File.open("test.txt", "w") do |file| 
			file << ""
		end

		File.open("test_results.txt", "w") do |file| 
			file << ""
		end
	end

	def write_in_txt
		File.open("test.txt", "a") do |file| 
			file << "\n\n\n"
			file << @essential_code
			file << "\n\n\n"
		end
	end

end
