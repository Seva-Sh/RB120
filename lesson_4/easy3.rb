# Question 1 ----------------------------------------

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# hello = Hello.new
# hello.hi               # works good
# hello.bye              # no method error
# hello.greet            # wrong number of arguments error
# hello.greet("Goodbye") # works good
# Hello.hi # no method error because looking for a class method, not instance method

# Question 2 ----------------------------------------

# class Greeting
#   def self.greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end

#   def self.hi
#     greet "Hi"
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.hi

# Question 3 ----------------------------------------

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# black = AngryCat.new(10, "blacky")
# white = AngryCat.new(20, "whity")
# p black
# p white

# Question 4 ----------------------------------------

# class Cat
#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     puts "I am a #{@type} cat"
#   end
# end

# c = Cat.new("tabby")
# c.to_s

# Question 5 ----------------------------------------

# class Television
#   def self.manufacturer # can only be called on the class itself
#     # method logic
#   end

#   def model # can only be called on an instance of a class
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer # this would throw a no method error
# tv.model # this would work fine ande xecute the code within the method

# Television.manufacturer # this would execute fine
# Television.model # this would throw a no method error

# Question 6 ----------------------------------------

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# Question 7 ----------------------------------------

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

# the class method info would make sense to be written as an instance method
# which would have access to instance vars brightness and color and which in
# turn could be used to return a custom message that info method includes
# actually it is the return in the last line
