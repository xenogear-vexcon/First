print 'Введите наименование товара (для выхода введите "stop"): '
good = gets.chomp
print 'Введите цену товара за единицу: '
price = (gets.chomp.to_f).round(2)
print 'Введите количество товара: '
count = (gets.chomp.to_f).round(2)

product_total = {}
basket_summ = 0

loop do
  print 'Введите наименование товара (для выхода введите "stop"): '
  good = gets.chomp
  break if good == 'stop'
  print 'Введите цену товара за единицу: '
  price = (gets.chomp.to_f)
  print 'Введите количество товара: '
  count = (gets.chomp.to_f)
  product_total[good] = {'цена': price, 'количество': count}
  basket_summ = basket_summ + price * count
end

puts product_total
p basket_summ