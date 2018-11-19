print 'Задайте день: '
day = gets.chomp.to_i
print 'Задайте месяц: '
month = gets.chomp.to_i
print 'Задайте год: '
year = gets.chomp.to_i

def Time.leap? year
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if Time.leap? year

days_calculation = months.take(month - 1).sum + day

puts "Прошло #{days_calculation} дней с начала #{year} года."