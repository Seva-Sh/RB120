=begin 

Problem:
- Instead of printing the values, each statement prints the name of the class to
- which it belongs
- 

Input: 
Output: 

Algorithm:
- 
-
-

=end

class Test
  attr_accessor :var

  def initialize(var)
    @var = var
  end
  
  def to_s
    "#{var.class}"
  end

end

a = Test.new("Hello")
b = Test.new(5)
c = Test.new([1, 2, 3])

puts a
puts b
puts c