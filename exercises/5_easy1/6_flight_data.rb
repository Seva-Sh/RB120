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

class Flight
  attr_accessor :database_handle # can be deleted

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end