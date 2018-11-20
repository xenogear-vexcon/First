array = [0, 1]

while array.last(2).sum < 100
  array << array[-1] + array[-2]
end

puts array
