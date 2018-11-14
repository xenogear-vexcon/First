puts 'Определим, является ли треугольник прямоугольным?!'
# sleep(1)
puts 'Введите 3 длины сторон в см:'
# sleep(1)
print 'Сторона a: '
a = gets.to_f
print 'Сторона b: '
b = gets.to_f
print 'Сторона c: '
c = gets.to_f

x, y, z = [a, b, c].sort

def rectangular?(x, y, z)
	z**2 == y**2 + x**2
end

def isosceles?(x, y, z)
	[x, y, z].uniq.size == 2
end

def equilateral?(x, y, z)
	[x, y, z].uniq.size == 1
end

if rectangular?(x, y, z) && isosceles?(x, y, z)
	puts 'Треугольник прямоугольный и равнобедренный'
elsif isosceles?(x, y, z) && equilateral?(x, y, z)
	puts 'Треугольник равнобедренный и равносторонний'
elsif rectangular?(x, y, z)
	puts 'Треугольник прямоугольный'
elsif isosceles?(x, y, z)
	puts 'Треугольник равнобедренный'
elsif equilateral?(x, y, z)
	puts 'Треугольник равносторонний'
else
	puts 'Треугольник обычный'
end