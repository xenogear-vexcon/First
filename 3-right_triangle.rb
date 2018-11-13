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

TRIANGLE = [a, b, c]
TRIANGLE.sort!
def rectangular?
	TRIANGLE[-1]**2 == TRIANGLE[0]**2 + TRIANGLE[1]**2
end

def isosceles?
	TRIANGLE.uniq.size == 2
end

def equilateral?
	TRIANGLE.uniq.size == 1
end

if rectangular? && isosceles?
	puts 'Треугольник прямоугольный и равнобедренный'
elsif isosceles? && equilateral?
	puts 'Треугольник равнобедренный и равносторонний'
elsif rectangular?
	puts 'Треугольник прямоугольный'
elsif isosceles?
	puts 'Треугольник равнобедренный'
elsif equilateral?
	puts 'Треугольник равносторонний'
else
	puts 'Треугольник обычный'
end