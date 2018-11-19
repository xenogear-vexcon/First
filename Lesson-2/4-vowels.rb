# letters = [('a'..'z').to_a, (1..26).to_a]
# l = Hash[*letters.transpose.flatten]
# vowels = %w[a e i o u y]
# # l.slice(:a, :e, :i, :o, :u, :y)
vowels = %w[a e i o u y]
vowels_letters = {}
("a".."z").each.with_index(1) do |letter, index|
  vowels_letters[letter] = index if vowels.include?(letter)
end

puts vowels_letters