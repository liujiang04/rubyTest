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
discap = '/Users/admin/Desktop/dsds/'
#FileUtils.cp('/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术图（英文）/所有的psd/art_pikachu俄文版/UI/ani_tuichu.psd',discap)
#
fileName = '/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术图（英文）/所有的psd/繁体翻译art pikaqiu/ui道具/fubenruchangjuan.png'
puts fileName

sss = 'a'
puts File.basename(fileName)
puts File.dirname(fileName)
puts "fsdafs".sub!(/[#{sss}]/, '######')
def mkDir(path)
  if !File.directory?(path)
    Dir.mkdir("#{File.expand_path(path)}")#创建tar目录
    #Dir.mkdir(path,:mode=>0777)
  end
end

ff = "/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术图（英文）/所有的psd/art_pikachu俄文版/UI/ani_tuichu.psd"
dd = "/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/art_pikachu/翻译美术图（英文）/所有的psd"


#ff.gsub(/[#{dd}]/, '')
ff[dd]=""
puts ff

