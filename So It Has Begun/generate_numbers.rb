def rand_hexstring(length)
  ((0..length).map{rand(256).chr}*"").unpack("H*")[0][0,length]
end

num = rand_hexstring(4)
num2 = rand_hexstring(4)

File.open("test.c", "w") do |file| 
	file.write("#include <stdio.h> \nint main(){ \n\tint orig = 0x#{num}; \n\tint num = 0x#{num2}; \n\tint result = orig & num; \n\tprintf(\"%d\",result); \n\treturn 0; \n}") # pls no hate ;(
end

system("gcc test.c");
result = system("./a.out > result.txt");
#puts result

f = File.open("result.txt", "r")
f.each_line do |line|
  puts line
end
f.close
