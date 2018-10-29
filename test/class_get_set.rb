class ClassGetSet

  #类变量是在类的所有实例中共享的变量。
  @@count = 0

  # 构造器方法
  def initialize(w,h)
    @width, @height = w, h
    @@count += 1
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
  # 实例方法
  def getArea
    @width * @height
  end

  def self.printCount() # 这是 status  或者 ClassGetSet.printCount()
    puts "Box count is : #@@count"
  end


  # to_s 方法
  # 您定义的任何类都有一个 to_s 实例方法来返回对象的字符串表示形式。下面是一个简单的实例，根据 width 和 height 表示 ClassGetSet 对象：
  def to_s
    "(w:#@width,h:#@height)"  # 对象的字符串格式
  end

end

# 创建对象
box = ClassGetSet.new(10, 20)

# 使用设置器方法
box.setWidth = 30
box.setHeight = 50

# 使用访问器方法
x = box.getWidth()
y = box.getHeight()

puts "盒子宽度 : #{x}"
puts "盒子高度 : #{y}"

a = box.getArea()
puts "Area of the box is : #{a}"

box2 = ClassGetSet.new(30, 100)

# 调用类方法来输出盒子计数
ClassGetSet.printCount()

# 创建对象
box = ClassGetSet.new(10, 20)

# 自动调用 to_s 方法
puts "String representation of box is : #{box}"


#继承 ！！
# 定义子类
class BigBox < ClassGetSet

  # 添加一个新的实例方法
  def printArea
    @area = @width * @height
    puts "Big box area is : #@area"
  end


  def getArea
    @width * @height
    puts "重写 getArea"
  end
end

# 创建对象
box = BigBox.new(10, 20)
box.getArea()

# 输出面积
box.printArea()

