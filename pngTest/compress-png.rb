#!/usr/bin/env ruby
require 'json'
require 'time'
require 'digest'
require_relative 'compressParameter.rb'
require_relative "../test/class_test"
# ruby  引入文件   很方便
class ImageCompressTool
  attr_accessor :noWenpMap
  # Create the object
  def initialize(path)
    # 操作路径,递归层层处理
    @path = path
    # 记录不生成webp,保留png格式的文件列表
    @noWenpMap = Hash.new()
    # 记录生成webp的图片列表
    @webpMap = Hash.new()
    # 记录生成png图片的最后更新时间和size
    @fileInfoMap = Hash.new()
    # 没有任何变化的图片
    @nochangeFileMap = Hash.new()
    self.loadPngFileLastInfo()
  end

  # convert to webp
  def compressImageToWebp()
    self._compressImageToWebp(@path)
  end

  # convert to webp
  def _compressImageToWebp(path = @path)
    # puts "compressImageToWebp on path #{path}"
    Dir.foreach(path) do |fileName|
      if fileName == "." || fileName == ".."
        next
      end

      file = File.join(path, fileName)
      if File.file?(file)
        extname = File.extname(fileName)
        if extname != ".png"
          next
        end
        fileNameNoExt = File.basename(fileName, ".png")

        size = File.size(file) 
        checksum = Digest::SHA2.file(file).hexdigest
        isFileChange = true
        # 比较图片的最后更新时间和size，如果都一致，那么就不用重新生成了
        lastInfoNew = {'checksum' => checksum}
        if @fileInfoMap.has_key?(file)
        	lastInfo = @fileInfoMap[file]
	        if lastInfo and lastInfo.has_key?('checksum')
	        	checksum0 = lastInfo['checksum']
	        	# puts "file #{fileName} checksum0 #{checksum0} checksum #{checksum}"
	        	if checksum0 == checksum
	        		# MD5码没有变化
	        		lastInfoNew = lastInfo
	        		@nochangeFileMap[file] = 1
	        		isFileChange = false
	        	end
	        end
	      end
	      @fileInfoMap[file] = lastInfoNew
        
        if size <= 2048
          @noWenpMap[fileNameNoExt] = 1
          # 依然生成webp文件，因为白鹭引擎，加载default.res.json比较晚，在这之前很多图已经需要用到了
          # next
        end
        # 特殊处理的字体文件,直接压缩到8位色,不需要256
        if $png8Bit.has_key?(fileName) or path.include?("/fnt")
          @noWenpMap[fileNameNoExt] = 1
          # 依然生成webp文件，因为白鹭引擎，加载default.res.json比较晚，在这之前很多图已经需要用到了
          # next
        end

        newWebp = path + fileNameNoExt + ".webp"
        if isFileChange
	        %x( cwebp -mt -quiet #{file} -o #{newWebp} )
	        puts "webp image #{newWebp}"
	      end
        # puts "webp image #{file} name #{newWebp}"
        # 判断压缩效果为原来的1/2,为有效
        sizeWebp = File.size(newWebp) * 2
        if sizeWebp >= size
          # 压缩后反而比png还大
          @noWenpMap[fileNameNoExt] = 1
        elsif
          @webpMap[fileNameNoExt] = 1
        end
      elsif File.directory?(file)
        self._compressImageToWebp(file + "/")
      end
    end
  end

  # compress png file
  def compressPng()
    self._compressPng(@path)
  end

  # compress png file
  def _compressPng(path = @path)
    Dir.foreach(path) do |fileName|
      if fileName == "." || fileName == ".."
        next
      end

      file = File.join(path, fileName)
      if File.file?(file)
        extname = File.extname(fileName)
        if extname != ".png"
          next
        end
        if @nochangeFileMap.has_key?(file)
        	next
        end
        	
        size = File.size(file)
        if size <= 2048
          next
        end
        len = fileName.length()
        # 部分图片之前已经处理错了,这里不应该再次压缩,否则图片效果堪忧
        if $pngNoCompress.has_key?(fileName)
          next
        end
        color = 256
        # 特殊处理的字体文件,直接压缩到8位色,不需要256
        if $png8Bit.has_key?(fileName) or path.include?("/fnt")
          color = 8
          # puts "直接压缩到8位色 #{fileName}"
        end
        %x( pngquant #{color} -f #{file} --output #{file} )
        # puts File.expand_path(file)
        checksum = Digest::SHA2.file(file).hexdigest
        # pngquant后的MD5码，重新计算MD5码
        lastInfo = {'checksum' => checksum}
        if @fileInfoMap.has_key?(file)
        	lastInfo = @fileInfoMap[file]
	        if lastInfo
	        	lastInfo['checksum'] = checksum
	        end
	      end
	      @fileInfoMap[file] = lastInfo
	      
      elsif File.directory?(file)
        # puts "Directory:", File.expand_path(file)
        self._compressPng(file)
      end
    end
  end

  def outputNoWebpJson(resPath)
    puts "save webp map info", Time.new()
    file = File.join(resPath, 'default.res.json')
    json = File.read(file)
    objTotal = JSON.parse(json)
    objTotal['noWebP'] = @noWenpMap
    File.open(file,"r+") do |f|
      # f.write("window.noWebpImages = ")
      f.write(JSON.pretty_generate(objTotal))
    end
  end
  
  def loadPngFileLastInfo()
    puts "load png file info", Time.new()
    file = File.join(@path, 'file_info.json')
    if File.file?(file)
	    json = File.read(file)
  	  @fileInfoMap = JSON.parse(json)
  	end
  end
  
  def savePngFileLastInfo()
    puts "save png file info", Time.new()
    file = File.join(@path, 'file_info.json')
    File.open(file,"w") do |f|
      # f.write("window.noWebpImages = ")
      f.write(JSON.pretty_generate(@fileInfoMap))
    end
  end
  
end

if __FILE__ == $0
  path = File.absolute_path(ARGV[0])
  tool = ImageCompressTool.new(path + "/")
  tool.compressImageToWebp()
  tool.compressPng()
  tool.outputNoWebpJson(path)
  tool.savePngFileLastInfo()
end

