names = Array.new

names = Array.new(20)
puts names.size  # 返回 20 #长度 使用size  类似java
puts names.length # 返回 20
tes = [5]
puts tes.size  # 返回 20 #长度 使用size  类似java
puts tes.length # 返回 20


names = Array.new(4, "mac")

puts "#{names}"

nums = Array.new(10) { |e| e = e * 2 } #e  就是 块里面的内容 类似 each

puts "#{nums}"


#数组还有另一种方法，[]，如下所示：
nums = Array.[](1, 2, 3, 4,5)
nums = Array[1, 2, 3, 4,5]

digits = Array(0..9)
puts "#{digits}"


digits = Array(0..9)

num = digits.at(4)

puts "#{num}"
