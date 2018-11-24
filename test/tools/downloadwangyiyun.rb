class Downloadwangyiyun
end
#不行
require 'rubygems'

ip = "586"
cmd = "/usr/sbin/tcpdump -lnA -s #{ip}" #  dst host #{ip} or src host #{ip}

f = IO.popen(cmd) do |f|

end
