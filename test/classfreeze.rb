# 定义类
class Box
  # 构造器方法
  def initialize(w,h)
    @width, @height = w, h
  end

  # 访问器方法
  def getWidth
    @width
  end
  def getHeight
    @height
  end

  # 设置器方法
  def setWidth=(value)
    @width = value
  end
  def setHeight=(value)
    @height = value
  end
end

# 创建对象
box = Box.new(10, 20)

# 让我们冻结该对象
box.freeze
if( box.frozen? )
  puts "Box object is frozen object"
else
  puts "Box object is normal object"
end

# 现在尝试使用设置器方法
box.setWidth = 30
box.setHeight = 50

# 使用访问器方法
x = box.getWidth()
y = box.getHeight()

puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"