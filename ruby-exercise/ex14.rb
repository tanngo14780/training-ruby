# "input:  - Nhập số nguyên N là số lượng phần tử mảng
puts "Nhập số lượng phần tử mảng:"
n = gets.chomp.to_i

# - nhập lần lượt N phần tử mảng
puts "Nhập các phần tử của mảng:"
array = []
n.times do
  array << gets.chomp.to_i
end
# output: in ra 1 hash với key là giá trị vừa nhập, value là số lần xuất hiện, sắp xếp hash theo số lần xuất hiện
hash = {}
array.each do |e|
  if hash[e] != nil
    hash[e] += 1
  else
    hash[e] = 1
  end
end

puts new_hash = hash.sort_by{ |key, value| value}.to_h

# VD
# 10 1 2 4 5 2 4 1 6 4 3
# -> {5=>1, 6=>1, 3=>1, 1=>2, 2=>2, 4=>3}"
# 1 2 1 
