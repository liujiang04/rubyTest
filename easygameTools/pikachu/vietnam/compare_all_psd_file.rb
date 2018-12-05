require 'json'
require 'time'
require 'digest'

require '../local_config'
require 'fileutils'

# 对比全部  psd 文件 查询出  没有用过的文件


class CompareAllPsdFile
  attr_accessor :noWenpMap
  # Create the object
  def initialize(allPsdPath, hasPsdPath ，_result_File)
    # 操作路径,递归层层处理
    @path = allPsdPath
    @hasPsdFile = hasPsdPath
    #最终生成没有  psd 的文件路径  需要给  渠道制作
    @_result_File = _result_File
    @allPPSDFileList = []
    @hasPPSDFileList = []
    self.begin()
  end


  def traverse_dir(file_path, allFile = [])
    if File.directory? file_path
      Dir.foreach(file_path) do |file|
        if file != "." and file != ".."
          traverse_dir(file_path + "/" + file, allFile = allFile)
        end
      end
    else
      puts "File:#{File.basename(file_path)}, Size:#{File.size(file_path)}"
    end
    return allFile
  end

  def begin()
    # 获取 两个文件夹 下所有的 psd 文件
    allFIleList = self.traverse_dir(@path)
    @allPPSDFileList = self.getPsdFileFromAllFile(allFIleList)


    hasPSdfileList = self.traverse_dir(@hasPPSDFile)
    @hasPPSDFileList = self.getPsdFileFromAllFile(hasPSdfileList)

    @allPPSDFileList.each do |fileName|
      if not self.chickHasFromList(File.basename(fileName),@hasPPSDFileList)


      end


    end


  end

  def copyFile(beginFile,endFile)
    FileUtils.cp "#{beginFile}","#{endFile}"
  end

  def chickHasFromList(fn,list)
    list.each do |fileName|
      if File.basename(fileName) == fn
        return true
      end
    end
    return false
  end

  def getPsdFileFromAllFile(allFIleList)
    resList = []
    allFIleList.each do |fileName|
      puts fileName
      if fileName.end_with?('psd')
        resList.push(fileName)
      end
    end
    return resList

  end


end


if __FILE__ == $0
  _beginTime = Time.new()


  allPsdFis = $svnPath + 'art_pikachu/翻译美术图（英文）/所有的psd '

  allReadyhasPsdPath = '/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术（越南）/越南合作方翻译图 '
  #最后生成文件的路径
  _result_File = ''
  path = File.absolute_path(ARGV[0])
  tool = CompareAllPsdFile.new(allPsdFis, allReadyhasPsdPath, _result_File)
  tool.compressImageToWebp()
  tool.compressPng()
  tool.outputNoWebpJson(path)
  tool.savePngFileLastInfo()


  puts "脚本运行时长 => ", Time.new() - _beginTime
end
