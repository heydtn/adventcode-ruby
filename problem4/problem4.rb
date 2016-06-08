require 'digest'

str = "yzbqklnj"
n = 0
while true do
  md5 = Digest::MD5.hexdigest(str + n.to_s)
  if md5[0..5] == "000000" then
    break
  end
  n += 1
  if n % 200000 == 0 then
    print n.to_s + "\n"
  end
end

print md5 + "\n"
print str + n.to_s + "\n"
