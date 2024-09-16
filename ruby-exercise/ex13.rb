puts "Nhập ngày làm việc : "
input = gets.chomp
puts join_time = Time.strptime(input,"%m/%d/%Y")
day_off = 0.0
current = Time.now

if join_time.year < current.year
  exp_year = current.year - join_time.year
  if exp_year >= 5
    day_off = 14
  elsif exp_year == 4
    day_off = 13
  else
    day_off = 12
  end
elsif join_time.year == current.year
  if join_time.day < 10
    day_off = month
  else
    day_off = month - 0.5
  end
end

puts "Số ngày nghỉ phép : #{day_off}"

