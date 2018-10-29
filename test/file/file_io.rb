
require 'json'


js = {"d"=>4}
puts js["d"]

aFile = File.new("input.txt", "r+")
if aFile
  aFile.syswrite("ABCDEF")
  aFile.rewind
  aFile.each_byte {|ch| putc ch; putc ?. }
else
  puts "Unable to open file!"
end

#写入 json
File.open("test.json","w") do |f|
  f.write(JSON.pretty_generate(js))
end



arr = IO.readlines("input.txt")
puts arr[0]
puts arr[1]

#File.rename( "test1.txt", "test2.txt" )
# File.delete("text2.txt")
#file.chmod( 0755 ) 设置权限
#

File.open("file.rb") if File::exists?( "file.rb" )

# 一个目录
puts File::directory?( "/usr/local/bin" ) # => true
# 一个文件
puts File::directory?( "file.rb" ) # => false


puts File.size?( "file_io.rb" )     # => 1002

#Dir.mkdir("mynewdir")
#
# Dir.mkdir( "mynewdir", 755 )
#
#