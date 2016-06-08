require 'set'

Op = Struct.new(:opcode, :dest, :arg1, :arg2)
ops = {}
$result = {}

def parse4(ops, vals)
  arg1 = (vals[0][2] != nil) ? vals[0][2] : vals[0][1].to_i
  arg2 = (vals[2][2] != nil) ? vals[2][2] : vals[2][1].to_i
  case vals[1][0]
  when "LSHIFT", "RSHIFT"
    ops.store( vals[3][2], Op.new(vals[1][0], vals[3][2], arg1, arg2) )
  when "OR", "AND"
    ops.store( vals[3][2], Op.new(vals[1][0], vals[3][2], arg1, arg2) )
  end
end

File.open("problem7.input") do |file|
  file.each_line do |line|
    vals = line.scan(/([A-Z]+)|(\d+)|([a-z]+)/)
    case vals.length
    when 2 # Static assign
      conv = Integer(vals[0][1]) rescue conv = vals[0][2]
      ops.store(vals[1][2], Op.new("ASSIGN", vals[1][2], conv))
    when 3 # NOT operation
      conv = Integer(vals[1][1]) rescue conv = vals[1][2]
      ops.store(vals[2][2], Op.new(vals[0][0], vals[2][2], conv))
    when 4
      parse4(ops, vals)
    end
  end
end

def evaluateData(ops, start)
  if start.class == Fixnum then
    return start
  end
  if $result.has_key? start.dest then
    return $result[start.dest]
  end

  arg1 = Integer(start.arg1) rescue arg1 = ops[start.arg1]
  arg2 = Integer(start.arg2) rescue arg2 = ops[start.arg2]
  case start.opcode
  when "NOT"
    val = (~evaluateData(ops, arg1)) & 0xFFFF
  when "OR"
    val = (evaluateData(ops, arg1) | evaluateData(ops, arg2)) & 0xFFFF
  when "ASSIGN"
    val = evaluateData(ops, arg1)
  when "AND"
    val = (evaluateData(ops, arg1) & evaluateData(ops, arg2)) & 0xFFFF
  when "LSHIFT"
    val = (evaluateData(ops, arg1) << evaluateData(ops, arg2))
  when "RSHIFT"
    val = (evaluateData(ops, arg1) >> evaluateData(ops, arg2))
  end

  $result[start.dest] = val
  return val
end

val = evaluateData(ops, ops["a"])
p val
