vowels = %w[a e i o u]
vowels_letters = {}
("a".."z").each.with_index(1) do |letter, index|
  vowels_letters[letter] = index if vowels.include?(letter)
end

puts vowels_letters
