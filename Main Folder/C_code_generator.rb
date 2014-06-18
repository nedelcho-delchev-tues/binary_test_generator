class C_code_generator
	@begining_of_C_file
	@ending_of_C_file
	@essential_code

	def initialize
		@begining_of_C_file = 
		"#include <stdio.h>\nint main(){"

		@ending_of_C_file = 
		"\n\treturn 0;\n}"
	end

	def create_C_file
		write_in_file
		run_C_file
		get_result
	end

	def write_in_file
		File.open("test_code.c", "w") do |file| 
			file.write("#{@begining_of_C_file} \n\tint orig = 0x#{123}; \n\tint num = 0x#{2342}; \n\tint result = orig & num; \n\tprintf(\"%d\",result); #{@ending_of_C_file}") # pls no hate ;(
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

asd = C_code_generator.new
asd.create_C_file
