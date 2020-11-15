def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

p example('hello')
