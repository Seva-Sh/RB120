=begin 

Problem:
- 
- 
- 

Input: 
Output: 

Algorithm:
- 
-
-

=end

class Cat
  # or attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    puts "Hello! My name is #{name()}!"
  end

end

kitty = Cat.new('Sophie')
kitty.greet