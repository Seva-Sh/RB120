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

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person.new('James')
p person1.name.reverse!
puts person1.name