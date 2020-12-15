# The getter & setter Methods

# define a class
class Box
  # initializing class variables
  @@count = 0

  # constructor method 
  def initialize(w, h)
    # assign instance variables
    @width, @height = w, h

    @@count += 1
  end

  # getter methods
  def getWidth
    @width
  end

  def getHeight
    @height 
  end

  # setter methods
  def setWidth=(value)
    @width = value
  end
  
  def setHeight=(value)
    @height = value
  end

  # instance method
  def getArea
    @width * @height
  end

  # class method
  def self.printCount()
    puts "Box count is : #{@@count}"
  end

  # define to_s method
  def to_s
    "(w:#{@width}, h:#{@height})"  # string formatting of the object
  end
end

# defining a subclass
class BigBox < Box

  # add a new instance method
  def getArea
    @area = @width * @height 
    puts "Big box area is : #{@area}"
  end
end

# create two object
# box1 = Box.new(10, 20)
# box2 = Box.new(30, 100)

new_box = BigBox.new(10, 20)
new_box.printArea

# puts "String representation of box is : #{box1}"

# # use setter methods
# box1.setWidth = 30
# box1.setHeight = 50

# # use getter methods
# x = box1.getWidth()
# y = box1.getHeight()

# # call instance methods
# a = box1.getArea()
# puts "Area of the box is : #{a}"

# # call class method to print box count
# Box.printCount()

# puts "Width of the box is : #{x}"
# puts "Height of the box is : #{y}"
