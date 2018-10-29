class ClassTest
  @@no_of_customers = 0

  def initialize(id, name, addr) #实例化的时候 调用
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
    self.printSome()
  end


  public def printSome()
    puts "some"

  end

  public def display_details()
    puts "Customer id #@cust_id"
    puts "Customer name #@cust_name"
    puts "Customer address #@cust_addr"
  end
  def total_no_of_customers()
    @@no_of_customers += 1
    puts "Total number of customers: #@@no_of_customers"
  end
end


cust1 = ClassTest.new("1", "John.end", "Wisdom Apartments, Ludhiya")
cust2 = ClassTest.new("2", "Poul", "New Empire road, Khandala")
# puts cust1::@cust_id


0==5? (puts '=') : (puts "!=")

puts (0..7).end
puts (0...7).end

foo = 42
puts defined? foo    # => "local-variable"
puts defined? $_     # => "global-variable"
puts defined? bar+ ""    # => nil（未定义）