range = (10..100)
array = []
range.each {|number| array << number if number % 5 == 0}
p array