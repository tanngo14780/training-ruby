# Nhập vào một mảng gồm n số từ bàn phím (quá trình nhập
# sẽ dừng khi người sử dụng nhập vào giá trị là chữ) sau đó
array = []
puts  "Input"

while true
  number = gets.chomp
  if number.match?(/^\d+$/)
    array << number.to_i
  elsif number.match?(/^\d+(\.\d+)?$/)
    array << number.to_f
  else
    puts "Invalid value"
    break
  end
end

# - hiển thị mảng vừa nhập
puts "Array [#{array.join(",")}]"

# - hiển thị giá trị nhỏ nhất của mảng ra màn hình.

# puts "Min = "+ array.min
min = array[0]
loop = array.length-1
loop.times do |i|
  if min >= array[i+1]
    min = array[i+1]
  end
end
puts "Min = #{min}"

# - tính giá trị trung bình của mảng
sum = 0
array.length.times do |i|
  sum = sum + array[i]
end
puts "Avg = #{sum/array.length}" 

# - tính tổng của mảng. dùng inject
sum2 = array.inject{|sum, sub| sum+sub}
puts "Total = #{sum2}"

# - tìm các phần tử có giá trị > 10
array2 =[]
array.length.times do |i|
  if array[i] > 10 
    array2 << array[i]
  end
end
if array2.length == 0 
  puts "Value >10 does not exist1 "
else 
  puts "Value >10 in array : [#{array2.join(",")}]"
end

# - tìm phần tử đầu tiên có giá trị > 10
first_value=nil
array.length.times do |i|
  if array[i] > 10
    puts "First value > 10 is #{array[i]}"
    first_value=true
    break
  end
end
if first_value == nil
  puts "Value >10 does not exist2 "
end

