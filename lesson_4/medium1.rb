# Question 1 ----------------------------------------

# class BankAccount
#   attr_reader :balance

#   def initialize(starting_balance)
#     @balance = starting_balance
#   end

#   def positive_balance?
#     balance >= 0
#   end
# end
# # he is missing either a self. or a @
# # actually no nothing is wrong
# b = BankAccount.new(1000)
# p b.positive_balance?

# Question 2 ----------------------------------------

# class InvoiceEntry
#   attr_accessor :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     quantity = updated_count if updated_count >= 0
#   end
# end
# # you need an attr_accessor here, and then we have to use setter method
# # self.quantity or just @quantity

# Question 3 ----------------------------------------

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     quantity = updated_count if updated_count >= 0
#   end
# end

# # nothing wrong, but it offers less flexibility
# # meaning you are allowing people to change value of quantity from anywhere

# Question 4 ----------------------------------------

# class Greeting
#   def greet(text)
#     puts text
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

# Question 5 ----------------------------------------

# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     @filling_type = "Plain" if @filling_type == nil
#     if @glazing == nil
#       "#{@filling_type}"
#     else
#       "#{@filling_type} with #{@glazing}"
#     end
#   end

#   # or
#   # def to_s
#   #   filling_string = @filling_type ? @filling_type : "Plain"
#   #   glazing_string = @glazing ? " with #{@glazing}" : ''
#   #   filling_string + glazing_string
#   # end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
# #  => "Plain"

# puts donut2
# #  => "Vanilla"

# puts donut3
# #  => "Plain with sugar"

# puts donut4
# #  => "Plain with chocolate sprinkles"

# puts donut5
# #  => "Custard with icing"

# Question 6 ----------------------------------------

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

x = Computer.new
x.create_template
puts x.template


# Question 7 ----------------------------------------

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end
