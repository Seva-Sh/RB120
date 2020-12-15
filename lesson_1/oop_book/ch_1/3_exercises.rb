# create an object 
class MyClass
  
end

my_obj = MyClass.new # creates or instantiates a new object of MyClass class

# What is a module? What is its purpose? How do we use them with our classes? 
# Create a module for the class you created in exercise 1 and include it properly.

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class HumanClass
  include Speak 
end

module Careers
  class Engineer
  end

  class Teacher
  end
end

first_job = Careers::Teacher.new