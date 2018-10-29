# 目前 不太懂 yield   好像是 碰到 yield  直接调用 {} 块里面的东西
#

def test
  puts "在 test 方法内"
  yield
  puts "你又回到了 test 方法内"
  yield
end

test {puts "你在块内"}
p 'fdsafdsa'


def test1
  yield 5
  puts "在 test 方法内"
  yield 100
end

test1 {|i| puts "你在块 #{i} 内"}


def test2
  yield
end

test2 {puts "Hello world"}


# 开始 执行  只能 是 begin end  执行
BEGIN {
  ddd = 54
  # BEGIN 代码块
  puts "BEGIN 代码块"
}

END {
  # END 代码块
  puts "END 代码块"
}
# MAIN 代码块
puts "MAIN 代码块"


