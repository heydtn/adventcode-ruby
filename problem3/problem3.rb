position = {0 => [0,0], 1 => [0,0]}
n = 0
hmap = {}

File.open("problem3.input") do |file|
  file.each_char do |c|
    cpos = position[n]
    hmap.store(cpos.to_s, 1)
    case c
    when "<"
      cpos[0] -= 1
    when ">"
      cpos[0] += 1
    when "^"
      cpos[1] += 1
    when "v"
      cpos[1] -= 1
    end
    hmap.store(cpos.to_s, 1)

    n = (n == 0) ? 1 : 0

  end
end

p hmap.keys.length
