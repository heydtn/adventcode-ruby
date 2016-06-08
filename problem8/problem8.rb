total1 = 0
total2 = 0
total3 = 0

File.open("problem8.input") do |file|
  file.each_line do |line|
    line = line.strip
    total1 += line.length
    total2 += line.gsub(/(\\[^x])|(\\x[a-fA-F0-9]{1,2})/,".").gsub(/(^")|("$)/,"").length
    total3 += line.gsub(/\\|"/, "\\.").length + 2
  end
end

p total1 - total2
p total3 - total1
