#模块提供了一个命名空间和避免名字冲突。
# 模块实现了 mixin 装置。
#

class Module
end

module Trig
  PI = 3.141592654
  def Trig.sin(x)
    # ..
  end
  def Trig.cos(x)
    # ..
  end
  class DD


  end
end


module Moral
  VERY_BAD = 0
  def Moral.sin(badness)
    # ...
  end
end



module Moral
  DSDSDS = 0
  BAD = 1 # 不可以覆盖
  def Moral.sin(badness) # 可以覆盖
    # ...
  end
end

puts Moral::DSDSDS