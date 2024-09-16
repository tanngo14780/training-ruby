puts "Nhập họ và tên : "

input = gets.strip.squeeze(" ")

array = input.split(" ")
first_name = array.last.capitalize
first_name1 = array.last[0].upcase
array.delete_at(-1)

new_array = []
array.each do |word|
  new_array << word[0].upcase
end

last_name = new_array.join

puts full_name = first_name+last_name
