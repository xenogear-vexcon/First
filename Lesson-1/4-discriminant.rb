puts 'Решаем уравнение вида a*x^2 + b*x + c = 0'
puts 'Введите коэффициенты.'
print 'Коэффициент a: '
a = gets.to_f
print 'Коэффициент b: '
b = gets.to_f
print 'Коэффициент c: '
c = gets.to_f

discr = b**2 - 4*a*c
raise "Дискриминант: #{discr}. С данными коэффициентами корней нет" if discr < 0

x_1 = format("%.2f", (-b + Math.sqrt(discr)) / (2 * a))
x_2 = format("%.2f", (-b - Math.sqrt(discr)) / (2 * a))

if discr > 0
	puts "Дискриминант: #{discr}. У нас будет 2 корня уравнения: #{x_1} и #{x_2}."
elsif discr == 0
	puts "Дискриминант: #{discr}. У нас будет 1 корень уравнения: #{x_1}."
end
