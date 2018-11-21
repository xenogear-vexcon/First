print 'Задайте день: '
day = gets.chomp.to_i
print 'Задайте месяц: '
month = gets.chomp.to_i
print 'Задайте год: '
year = gets.chomp.to_i

def leap?(year)
  ((year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0))
end

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if leap?(year)

days_calculation = months.take(month - 1).sum + day

puts "Прошло #{days_calculation} дней с начала #{year} года."
