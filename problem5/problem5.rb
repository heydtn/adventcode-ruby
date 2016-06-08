reg = /(?=^.*([a-zA-Z])\1+.*$)(?=^(.*[aeiou].*){3,}$)(^((?!ab|cd|pq|xy).)*$)/
reg2 = /(?=^.*([a-zA-Z]{2}).*\1.*$)(?=^.*([a-zA-Z])[a-zA-Z]\2.*$)/
total = 0
total2 = 0

File.open("problem5.input") do |file|
  file.each_line do |line|
    if (reg.match(line) != nil) then
      total += 1
    end
    if (reg2.match(line) != nil) then
      total2 += 1
    end
  end
end

puts total
puts total2
