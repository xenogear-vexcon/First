array = [0, 1]
x = 1
begin
  array << x
  x = array[-1] + array[-2]
end while x < 100
puts array