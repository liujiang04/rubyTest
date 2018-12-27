# 和 go 项目 一样 直接 在 项目 目录下

Tools = {}
def Tools.saveFie(fileName,content)
  puts("fileName =>" + fileName)
  File.open(fileName,"w") do |f|
    f.write(content)
  end
end

