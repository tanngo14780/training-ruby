puts "Nhập số lượng phần tử mảng:"
n = gets.chomp.to_i

puts "Nhập các phần tử của mảng:"
array = []
n.times do
  array << gets.chomp.to_i
end

hash = {}
array.each do |e|
  if hash[e] != nil
    hash[e] += 1
  else
    hash[e] = 1
  end
end

puts new_hash = hash.sort_by{ |key, value| value}.to_h

