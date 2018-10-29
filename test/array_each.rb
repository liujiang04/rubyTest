
#each 迭代器总是与一个块关联。它向块返回数组的每个值，一个接着一个。值被存储在变量 i 中，然后显示在屏幕上。

ary = [1,2,3,4,5]
ary.each do |i|
  puts i
end


#collect 迭代器返回集合的所有元素。
# collect 方法不需要总是与一个块关联。collect 方法返回整个集合，不管它是数组或者是哈希。
# collect 方法不是数组间进行复制的正确方式。这里有另一个称为 clone 的方法，用于复制一个数组到另一个数组。

a = [1,2,3,4,5]
b = Array.new
b = a.collect{ |x|x }
puts b.inspect
c  = a.clone
puts c.inspect