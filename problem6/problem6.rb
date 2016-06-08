$heightMax = 999
$widthMax = 999
lights = Hash.new(0)

def parseRange(range)
  return range.split(",").map(&:to_i)
end

def setRange(hmap, start, finish, op)
  for i in start[1]..finish[1]
    y = i*$widthMax
    for j in start[0]..finish[0]
      case op
      when 1
        hmap[y+j] += 1
      when 0
        hmap[y+j] += 2
      when -1
        hmap[y+j] = (hmap[y+j] > 0) ? hmap[y+j]-1 : 0
      end
    end
  end
end

def turnOn(hmap, start, finish)
  setRange(hmap, start, finish, 1)
end

def turnOff(hmap, start, finish)
  setRange(hmap, start, finish, -1)
end

def toggle(hmap, start, finish)
  setRange(hmap, start, finish, 0)
end

linenum = 0
File.open("problem6.input") do |file|
  file.each_line do |line|
    if linenum % 30 == 0 then
      puts linenum
    end
    line = line.sub(/turn (off|on)/,"turn\\1").split(" ")
    range1 = parseRange(line[1])
    range2 = parseRange(line[3])

    case line[0]
    when "turnon"
      turnOn(lights, range1, range2)
    when "turnoff"
      turnOff(lights, range1, range2)
    when "toggle"
      toggle(lights, range1, range2)
    end
    linenum += 1
  end
end

total = 0
lights.each_value {|x| total += x}
puts total
