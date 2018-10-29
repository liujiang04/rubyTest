time1 = Time.new

puts "当前时间 : " + time1.to_s #转字符串  类型 to_S?

# Time.now 功能相同
time2 = Time.now
puts "当前时间 : " + time2.inspect


time = Time.new

# Time 的组件
puts "当前时间 : " + time.inspect
puts "年份 : " + time.year.to_s # => 日期的年份
puts "月份 : " + time.month.inspect # => 日期的月份（1 到 12）
puts "天 : " + time.day.to_s # => 一个月中的第几天（1 到 31）
puts "星期 :" + time.wday.to_s # => 一周中的星期几（0 是星期日）
puts "一年中的第几天 :" + time.yday.to_s # => 365：一年中的第几天
puts ":" + time.hour.inspect # => 23：24 小时制
puts ":" + time.min.inspect # => 59
puts ":" + time.sec.inspect # => 59
puts "微秒: " + time.usec.inspect # => 999999：微秒
puts "时区名称" + time.zone.to_s # => "UTC"：时区名称


# July 8, 2008
puts Time.local(2008, 7, 8)
# July 8, 2008, 09:10am，本地时间
puts Time.local(2008, 7, 8, 9, 10)
# July 8, 2008, 09:10 UTC
puts Time.utc(2008, 7, 8, 9, 10)
# July 8, 2008, 09:10:11 GMT （与 UTC 相同）
puts Time.gm(2008, 7, 8, 9, 10, 11)

#[sec,min,hour,day,month,year,wday,yday,isdst,zone]
time = Time.new

values = time.to_a
p values


# 返回从纪元以来的秒数
time = Time.now.to_i #unix 时间戳
puts time
# 把秒数转换为 Time 对象
puts Time.at(time)

# 返回从纪元以来的秒数，包含微妙
time = Time.now.to_f

puts time


#格式化  日期
#a
time = Time.new
puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%y-%m-%d %H:%M:%S")

#日期计算
now = Time.now           # 当前时间
puts now
past = now - 10          # 10 秒之前。Time - number => Time
puts past
future = now + 10        # 从现在开始 10 秒之后。Time + number => Time
puts future
diff = future - now      # => 10  Time - Time => 秒数
puts diff