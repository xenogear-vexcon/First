puts 'Добро пожаловать'
product_total = {}
basket_summ = 0

loop do
  print 'Введите наименование товара (для выхода введите "stop"): '
  good = gets.chomp
  break if good == 'stop'
  print 'Введите цену товара за единицу: '
  price = gets.chomp.to_f
  print 'Введите количество товара: '
  count = gets.chomp.to_f
  product_total[good] = { price: price, count: count }
end

product_total.each do |good, total|
  basket_summ = basket_summ + total[:price] * total[:count]
end

puts "В вышей корзине: #{product_total}"
puts "Всего товаров на: #{basket_summ}"
