require 'pdfkit'

class Code_generator
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

		@all_tasks = ""

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
		result = system("./a.out >> tests/test_#{@test_id}_results.html");
	end

	def results_pdf
		results_file = File.new("tests/test_#{@test_id}_results.html", "r")
		kit = PDFKit.new(results_file)
		kit.to_file("tests/test_results_#{@test_id}.pdf")
	end
		
	def	merge_tasks
		@all_tasks += @essential_code.split("printf")[0]
	end

	def convert
		#data_file = "tests/test_#{@test_id}.html"
		data_file = File.new("tests/test_#{@test_id}.html", "w+")
		#tests_path = "/tests"
		data_file.puts "<html>"
		File.open(File.expand_path(data_file), "a") do |file|
			file.write(merge_tasks)
			file << "</html>"
		end
		kit = PDFKit.new(data_file)
		kit.to_file("tests/test_#{@test_id}.pdf")
		results_pdf
	end
end
