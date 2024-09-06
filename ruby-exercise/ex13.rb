require 'Time'
# "Thực hiện viết chương trình tính số ngày nghỉ phép theo thâm niên làm việc
# Input: Ngày vào làm có định dạng mm/dd/yyyy
puts "Nhập ngày làm việc : "
input = gets.chomp
puts join_time = Time.strptime(input,"%m/%d/%Y")
day_off = 0.0
current = Time.now

# Output: Số ngày nghỉ phép (Float)
# Logic nghiệp vụ:

if join_time.year < current.year
  # - Trường hợp ngày vào làm < năm hiện tại:
  # + Thâm niên từ 5 năm trở lên: 14 ngày
  # + Thâm niên từ 4 năm trở lên: 13 ngày
  # + Các trường hợp còn lại: 12 ngày
  exp_year = current.year - join_time.year
  if exp_year >= 5
    day_off = 14
  elsif exp_year == 4
    day_off = 13
  else
    day_off = 12
  end
elsif join_time.year == current.year
  # - Trường hợp ngày vào làm trong năm hiện tại:
  # Tính theo số tháng làm việc đến cuối năm, trong đó:
  # + Ngày vào làm từ ngày 10 trở đi => Tháng đó được tính 0.5 ngày
  # + Ngày vào làm nhỏ hơn ngày 10 => Tháng đó được tính 1 ngày
  month = 12- join_time.month +1 #+1 tháng hiện tại
  if join_time.day < 10
    day_off = month
  else
    day_off = month - 0.5
  end
end

puts "Số ngày nghỉ phép : #{day_off}"

# Ví dụ: Ngày hiện tại là 4/4/2020
# + Ngày vào làm: 10/03/2020 => Số ngày nghỉ phép: 9.5
# + Ngày vào làm: 07/03/2020 => Số ngày nghỉ phép: 10
# + Ngày vào làm: 04/12/2019 => Số ngày nghỉ phép: 12
# + Ngày vào làm: 10/10/2015 => Số ngày nghỉ phép: 13
# + Ngày vào làm: 25/03/2015 => Số ngày nghỉ phép: 14"
