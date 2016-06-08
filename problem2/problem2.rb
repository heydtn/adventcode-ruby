total = 0
ribbon = 0
File.open("problem2.input") do |file|
  file.each_line do |line|
    values = line.split("x").map {|x| Integer(x)}.sort
    ribbon += values.reduce(:*) + 2*(values[0]+values[1])
    total += 2*(values[0]*values[1] + values[1]*values[2] + values[0]*values[2]) + values[0] * values[1]
  end
end

puts total
puts ribbon
