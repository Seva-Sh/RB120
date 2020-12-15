# Question 1 ----------------------------------------

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# puts oracle.predict_the_future

# Question 2 ----------------------------------------

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# puts trip.predict_the_future

# Since we are calling predict_the_future on an instance of RoadTrip, every
# time Ruby will start with the methods defined on the class you are calling

# Question 3 ----------------------------------------

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# p Orange.ancestors
# # this is also called a lookup chain, and this is a class method not instance

# Question 4 ----------------------------------------

# class BeesWax
#   attr_accessor :type
#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

# Question 5 ----------------------------------------

# excited_dog = "excited dog"   # local variable example
# @excited_dog = "excited dog"  # instance variable example
# @@excited_dog = "excited dog" # class variable example
# # we can differentiate them by their prefixes

# Question 6 ----------------------------------------

# class Television
#   def self.manufacturer # this is a class method
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end
# # to call it use class name followed by the method name
# Television.manufacturer

# Question 7 ----------------------------------------

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
# # it is a class variable, the value of which gets incremented by 1 every time
# # we initialize a new instance of a class Cat
# b = Cat.new("hi")
# puts Cat.cats_count

# Question 8 ----------------------------------------

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end

# Question 9 ----------------------------------------

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
#   def play
#     "Start the Bingo!"
#   end
# end

# b = Bingo.new
# puts b.play

# Question 10 ----------------------------------------

Makes it easy to control and maintain large projects.
You are able to safeguard some parts of the code that should not be tinkered with
Various teams can be given various parts of code to work on
Simplifies big projects in the long run
Allows to think more abstractly about the code
Objects are represented by nouns so easy to conceptualize