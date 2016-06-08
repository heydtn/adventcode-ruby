total = 0
File.open("problem1.input") do |file|
	f.each_line do |line|
		values = line.split("x").map {|x| return Integer(x)}
		total = values.min + 2*values[0]*values[1] + 2*values[1]*values[2] + 2*values[0]*values[2]
  end
end

puts total
