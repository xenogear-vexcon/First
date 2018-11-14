puts 'Введите, пожалуйста, ваше имя и рост, и я скажу вам ваш идеальный вес!'
print 'Ваше имя:  '
name = gets.chomp.capitalize
print 'И ваш рост в см:  '
height = gets.to_f
perfect_weight = height - 110
if height > 110
	puts "#{name}, ваш идеальный вес - #{perfect_weight}."
else
	puts "#{name}, ваш вес уже оптимальный."
end
