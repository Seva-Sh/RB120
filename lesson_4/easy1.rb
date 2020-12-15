# Question 1 ----------------------------------------

# p true.class
# p "hello".class
# p [1, 2, 3, "happy days"].class
# p 142.class

# Question 2 ----------------------------------------

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed

#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# toyo = Car.new
# tr = Truck.new
# toyo.go_fast
# tr.go_fast

# Question 3 ----------------------------------------

# We are using self.class which points to the name of the class itself
# self refers to the object itself
# the to_s method is being called automatically because we are using string interpolation

# Question 4 ----------------------------------------

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# b = AngryCat.new # .new tells Ruby this new object is an instance of AngryCat

# Question 5 ----------------------------------------

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# p = Pizza.new("cheese")
# f = Fruit.new("apple")
# p p.instance_variables # lists all instance variables
# p f.instance_variables

# Pizza class has an instance variable @name

# Question 6 ----------------------------------------

# class Cube
#   def initialize(volume)
#     @volume = volume
#   end

#   def get_volume
#     @volume
#   end
# end

# big_cude = Cube.new(5)


# Question 7 ----------------------------------------

# p big_cude.to_s
# "#<Cube:0x0000564485bff390>"

# Question 8 ----------------------------------------

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# self refers to the instance variable @age initialized in the constructor method
# it actually referencing the instance object that called the method - the calling object

# Question 9 ----------------------------------------

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# # this self refers to the class that this class method was initialized in, this case Cat

# Question 10 ----------------------------------------

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

black_bag = Bag.new("black", "soft")

p black_bag