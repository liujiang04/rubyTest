# 从 begin 到 rescue 中的一切是受保护的。如果代码块执行期间发生了异常，控制会传到 rescue 和 end 之间的块。
# 对于 begin 块中的每个 rescue 子句，Ruby 把抛出的异常与每个参数进行轮流比较。如果 rescue 子句中命名的异常与当前抛出的异常类型相同，或者是该异常的父类，则匹配成功。
# 如果异常不匹配所有指定的错误类型，我们可以在所有的 rescue 子句后使用一个 else 子句。
begin
  file = open("/unexistant_file")
  if file
    puts "File opened successfully"
  end
rescue
  file = STDIN
end
print file, "==", STDIN, "\n"




#您可以使用 rescue 块捕获异常，然后使用 retry 语句从开头开始执行 begin 块。
# 打开时发生异常。
# 跳到 rescue。fname 被重新赋值。
# 通过 retry 跳到 begin 的开头。
# 这次文件成功打开。
# 继续基本的过程
# begin
#   puts "begin run"
#   file = open("/unexistant_file")
#   if file
#     puts "File opened successfully"
#   end
# rescue
#   fname = "existant_file"
#   retry
# end

#您可以使用 raise 语句抛出异常。下面的方法在调用时抛出异常。它的第二个消息将被输出。
# raise
# #或
# raise "Error Message"
# #或
# raise ExceptionType, "Error Message"
#或
#raise ExceptionType, "Error Message" condition


begin
  puts 'I am before the raise.'
  raise 'An error has occurred.'
  puts 'I am after the raise.'
rescue
  puts 'I am rescued.'
end
puts 'I am after the begin block.'

begin
  raise 'A test exception.'
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end



#ensure 放在最后一个 rescue 子句后，并包含一个块终止时总是执行的代码块。
# 它与块是否正常退出、是否抛出并处理异常、是否因一个未捕获的异常而终止，这些都没关系，ensure 块始终都会运行。
#
#
begin
  raise 'A test exception.'
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
ensure
  puts "Ensuring execution"
end
# 如果提供了 else 子句，它一般是放置在 rescue 子句之后，任意 ensure 之前。
# else 子句的主体只有在代码主体没有抛出异常时执行。
#
begin
  # 抛出 'A test exception.'
  puts "I'm not raising exception"
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
else
  puts "Congratulations-- no errors!"
ensure
  puts "Ensuring execution"
end


# raise 和 rescue 的异常机制能在发生错误时放弃执行，有时候需要在正常处理时跳出一些深层嵌套的结构。
# 此时 catch 和 throw 就派上用场了。
# catch 定义了一个使用给定的名称（可以是 Symbol 或 String）作为标签的块。
# 块会正常执行直到遇到一个 throw。
#
def promptAndGet(prompt)
  print prompt
  res = readline.chomp
  throw :quitRequested if res == "!"
  return res
end

catch :quitRequested do
  name = promptAndGet("Name: ")
  age = promptAndGet("Age: ")
  sex = promptAndGet("Sex: ")
  # ..
  # 处理信息
end
promptAndGet("Name:")

