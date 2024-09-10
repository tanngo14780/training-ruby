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
puts "Min = #{array.min}"

# - tính giá trị trung bình của mảng
sum = array.sum
puts "Avg = #{sum / array.length}"

# - tính tổng của mảng sử dụng inject thay vì sum
sum2 = array.inject{|sum, sub| sum+sub}
puts "Total = #{sum2}"

no_value_message = "Value > 10 does not exist"

# - tìm các phần tử có giá trị > 10
array2 = array.select { |num| num > 10 }

if array2.empty?
  puts no_value_message
else 
  puts "Value >10 in array: [#{array2.join(",")}]"
end

# - tìm phần tử đầu tiên có giá trị > 10
first_value = array.find { |num| num > 10 }

if first_value
  puts "First value > 10 is #{first_value}"
else
  puts no_value_message
end

