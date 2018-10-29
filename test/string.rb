

# 双引号字符串
# 在双引号字符串中我们可以使用 #{} 井号和大括号来计算表达式的值：
# 字符串中嵌入变量：

name1 = "Joeq"
name2 = "Maryq"
puts "你 #{name1},  #{name2} 在?" , Time.new()

x, y, z = 12, 36, 72
puts "x 的值为 #{ x }" , Time.new()
puts "x + y 的值为 #{ x + y }" ,Time.new()
puts "x + y + z 的平均值为 #{ (x + y + z)/3 }" , Time.new()


# Ruby 中还支持一种采用 %q 和 %Q 来引导的字符串变量，%q 使用的是单引号引用规则，而 %Q 是双引号引用规则，后面再接一个 (! [ { 等等的开始界定符和与 } ] ) 等等的末尾界定符。
# 跟在 q 或 Q 后面的字符是分界符.分界符可以是任意一个非字母数字的单字节字符.如:[,{,(,<,!等,字符串会一直读取到发现相匹配的结束符为止.
#
desc1 = %Q{Ruby 的字符串可以使用 '' 和 ""。}
desc2 = %q|Ruby 的字符串可以使用 '' 和 ""。|

puts desc1
puts desc2

#
# String 对象的实例来调用 String 方法。下面是创建 String 对象实例的方式：
#
myStr = String.new("THIS IS TEST")
foo = myStr.downcase
puts "#{foo}"


puts "abc \0\0abc \0\0".unpack('A6Z6')   #=> ["abc", "abc "]
puts "abc \0\0".unpack('a3a3')           #=> ["abc", " \000\000"]
puts "abc \0abc \0".unpack('Z*Z*')       #=> ["abc ", "abc "]
puts "aa".unpack('b8B8')                 #=> ["10000110", "01100001"]
puts "aaa".unpack('h2H2c')               #=> ["16", "61", 97]
puts "\xfe\xff\xfe\xff".unpack('sS')     #=> [-2, 65534]
puts "now=20is".unpack('M*')             #=> ["now is"]
puts "whole".unpack('xax2aX2aX1aX2a')    #=> ["h", "e", "l", "l", "o"]
