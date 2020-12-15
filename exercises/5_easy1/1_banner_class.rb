=begin 

Problem:
- Assign a fixed banner width. Message should be centered within the banner
  of that width
- Banner width cannot be smaller than message.size + 2
  Banner width cannot be larger than 75
  Inbetween that is pass
- 

Input: 
Output: 

Algorithm:
- 
-
-

=end

class Banner
  def initialize(message)
    @message = message
    @length = nil
    loop do
      puts "Would you like to go with default length or specify a custom one?"
      puts "For default enter '0', for custom choose between #{@message.size + 2} and 75"
      @length = gets.chomp.to_i
      if @length == 0 || (@length > (@message.size + 2) && @length < 76)
        break
      else
        puts "Wrong choice, try again!"
      end
    end
    
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    if @length == 0
      "+ #{'-' * @message.size} +"
    else
      "+ #{'-' * @length} +"
    end
  end

  def empty_line
    if @length == 0
      "| #{' ' * @message.size} |"
    else
      "| #{' ' * @length} |"
    end
  end

  def message_line
    if @length == 0
      "| #{@message} |"
    else
      "| #{@message.center(@length)} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

# banner = Banner.new('')
# puts banner