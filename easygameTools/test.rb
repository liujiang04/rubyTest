puts 'abcdefg.psd'.end_with?('psd')
# -*- coding: UTF-8 -*-
require 'fileutils'
require 'ftools'
# _beginTime = Time.new()
# puts "save webp map info", (Time.new() - _beginTime)
#
#
# puts "save webp map info".split(" ")[0]
#
#File.copy '/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术图（英文）/所有的psd/繁体翻译art\ pikaqiu/ui道具/fubenruchangjuan.png', '/Users/admin/Desktop/fubenruchangjuan.png'
discap = '/Users/admin/Desktop/dsad/fds/ds'
# FileUtils.cp('/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术图（英文）/所有的psd/繁体翻译art pikaqiu/ui道具/fubenruchangjuan.png',discap)
#


def mkDir(path)
  if !File.directory?(path)
    Dir.mkdir("#{File.expand_path(path)}")#创建tar目录
    #Dir.mkdir(path,:mode=>0777)
  end
end

mkDir(discap)

def cp(fileName)
  # if !newDir.empty?
  #   dst_dir = file_path+"good"
  #   ds = dst_dir+"/"+newDir
  #   # FileUtils.mkdir(dst_dir,:mode=>0777) if !File.directory?(dst_dir)
  #   # FileUtils.mkdir(ds,:mode=>0777) if !File.directory?(ds)
  #
  #   FileUtils.mkdir(dst_dir,:mode=>0777) if !File.directory?(dst_dir)
  #   FileUtils.mkdir(ds,:mode=>0777) if !File.directory?(ds)
  # end


end