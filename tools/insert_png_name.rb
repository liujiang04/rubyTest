require 'find'

class InsertPngName


end
#获取所有文件

def traverse_dir(file_path,allFile = [])
  if File.directory? file_path
    Dir.foreach(file_path) do |file|
      if file !="." and file !=".."
        traverse_dir(file_path+"/"+file,allFile = allFile)
      end
    end
  else
    puts "File:#{File.basename(file_path)}, Size:#{File.size(file_path)}"
  end
  return allFile
end
if __FILE__ == $0
  alll =  traverse_dir("/Users/admin/Desktop/英文版更新/img2")
  puts "down"

end

require "zlib"
include Zlib
# Find.find('/Users/happy') do |path|
#   puts path
# end
#
#