class RechangeAdd

  def initialize(w,h) # 初始化 width 和 height
    @width,@height = w, h
  end

  def +(other)         # 定义 + 来执行向量加法
    RechangeAdd.new(@width + other.width, @height + other.height)
  end

  def -@               # 定义一元运算符 - 来对 width 和 height 求反
    RechangeAdd.new(-@width, -@height)
  end

  def *(scalar)        # 执行标量乘法
    RechangeAdd.new(@width*scalar, @height*scalar)
  end

end

