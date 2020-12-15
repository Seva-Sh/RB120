class Person
  def initialize(name="unknown", age=0)
    @name = name
    @age = age
  end

  def get_name
    @name
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end
end

p1 = Person.new
p2 = Person.new("unknown", 17)
p3 = Person.new("Becky", 19)
p4 = Person.new("Robert")

puts p1, p2, p3, p4