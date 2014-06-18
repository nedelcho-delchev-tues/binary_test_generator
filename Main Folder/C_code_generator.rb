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
		get_result
	end

	def write_in_file
		File.open("test_code.c", "w") do |file| 
			file.write("#{@begining_of_C_file}\n #{@essential_code}\n #{@ending_of_C_file}")
		end
	end

	def run_C_file
		system("gcc test_code.c");
		result = system("./a.out > result.txt");
	end

	def get_result
		f = File.open("result.txt", "r")
		f.each_line do |line|
			puts line
		end
		f.close
	end


end
