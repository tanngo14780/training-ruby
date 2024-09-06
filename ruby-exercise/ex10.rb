# "1, Tạo một mảng số nguyên có 5 phần tử bằng cách cho nhập từng số, nếu k nhập gì tự động set giá trị là 0
array = []

(0...5).each do |i|
  puts "Nhap phan tu thu #{i+1}: "
  input = gets.chomp
  if input.empty? == false
    array << input.to_i
  else
    array << 0
  end
end

# 2, In ra tổng các phần tử trong mảng
sum = 0
array.length.times do |i|
  sum+= array[i].to_i
end
puts  "Tong : #{sum} " 

# 3, Sử dụng Proc dùng mảng trên in ra mảng có lũy thừa tương ứng với từng phần tử, nếu phần tử bằng 6 hoặc 7 sẽ in ra giữ nguyên giá trị k lũy thừa
luy_thua = Proc.new{ |n| n*n  }

array.map! do |i|
  luy_thua.call(i)  
end
puts array.inspect
# VD:
# [1, 2, 3, 4, 5] => output: [1, 4, 9, 16, 25]
# [2, 3, 3, 6, 7] => output: [4, 9, 9, 6, 7]
# "