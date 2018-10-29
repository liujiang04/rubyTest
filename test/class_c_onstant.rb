# 定义类
class Box
  BOX_COMPANY = "TATA Inc"  #public status
  BOXWEIGHT = 10

  # 构造器方法
  attr_accessor :width, :height
  def initialize(w,h)
    @width, @height = w, h
  end
  # 实例方法
  def getArea
    return @width * @height
  end
end

# 创建对象
box = Box.new(10, 20)

# 调用实例方法
a = box.getArea()

puts "Area of the box is : #{a}"
puts Box::BOX_COMPANY

puts "Box weight is: #{Box::BOXWEIGHT}"