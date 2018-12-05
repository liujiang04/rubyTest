class ForIfWhile
end
require 'json'

x=1
if x > 2
  puts "x 大于 2"
elsif x <= 2 and x!=0
  puts "x 是 1"
else
  puts "无法得知 x 的值"
end


x=1
unless x>2  #如果不 if not ?
  puts "x 小于 2"
else
  puts "x 大于 2"
end

if not x >2
  puts "x 小于 2"
else
  puts "x 大于 2"
end
#
# code unless conditional
# 如果 conditional 为假，则执行 code。

$var =  1
print "1 -- 这一行输出\n" if $var
print "2 -- 这一行不输出\n" unless $var

$var = false
print "3 -- 这一行输出\n" unless $var



$age =  5
case $age
when 0 .. 2
  puts "婴儿"
when 3 .. 6
  puts "小孩"
when 7 .. 12
  puts "child"
when 13 .. 18
  puts "少年"
else
  puts "其他年龄段的"
end

foo = false
bar = true
quu = false

case
when foo then puts 'foo is true'
when bar then puts 'bar is true'
when quu then puts 'quu is true'
end
# 显示 "bar is true"
#
#
#
# for 循环

$i = 0
$num = 5

while $i < $num  do
  puts("在循环语句中 i = #$i" )
  $i +=1
end


$i = 0
$num = 5
begin
  puts("while在循环语句中 i = #$i" )
  $i +=1
end while $i < $num


$i = 0
$num = 5
#直到
until $i > $num  do
  puts("直到在循环语句中 i = #$i" )
  $i +=1
end

$i = 0
$num = 5
begin
  puts("直到在循环语句中 i = #$i" )
  $i +=1;
end until $i > $num



for i in 0..5
  puts "for局部变量的值为 #{i}"
end
# 等价于 下面的 i  就是 0-5 里面的内容  好像 这样些 更好

(8..10).each do |i|
  puts i
end


#break
for i in 0..5
  if i > 2 then
    break
  end
  puts "局部变量的值为 #{i}"
end

#next  相当于 continue
for i in 0..5
  if i < 2 then
    next
  end
  puts "局部变量的值为 #{i}"
end


#redo  重新开始最内部循环的该次迭代，不检查循环条件。如果在块内调用，则重新开始 yield 或 call。

for i in 0..5
  if i < 2 then
    puts "redo 内部 局部变量的值为 #{i}"
    i +=1
    redo
  end

  puts "redo 外部  局部变量的值为 #{i}"
end


