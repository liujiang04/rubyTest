
=begin
当一个类可以从多个父类继承类的特性时，该类显示为多重继承。
Ruby 不直接支持多重继承，但是 Ruby 的模块（Module）有另一个神奇的功能。它几乎消除了多重继承的需要，提供了一种名为 mixin 的装置。
Ruby 没有真正实现多重继承机制，而是采用成为mixin技术作为替代品。将模块include到类定义中，模块中的方法就mix进了类中。
=end


module A
  def a1
  end
  def a2
  end
end
module B
  def b1
  end
  def b2
  end
end

class Sample
  include A
  include B
  def s1
  end
end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1

# 模块 A 由方法 a1 和 a2 组成。
# 模块 B 由方法 b1 和 b2 组成。
# 类 Sample 包含了模块 A 和 B。
# 类 Sample 可以访问所有四个方法，即 a1、a2、b1 和 b2。
# 因此，您可以看到类 Sample 继承了两个模块，您可以说类 Sample 使用了多重继承或 mixin 。

