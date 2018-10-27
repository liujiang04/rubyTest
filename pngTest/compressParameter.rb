#!/usr/bin/env ruby

# 特殊处理的字体文件,直接压缩到8位色,不需要256
p8 = Hash.new()
p8["ssss"] = 1
# 特殊处理的字体文件,直接压缩到8位色,不需要256
$png8Bit = p8

# 无需压缩的png图片
noCompress = Hash.new()
noCompress["sss"] = 1

# 无需压缩的png图片
$pngNoCompress = noCompress

