array = [0, 1]

while (x = array.last(2).sum) < 100
  array << x
end

puts array
