# Chuẩn hóa chuỗi
# input: nhập vào họ và tên
puts "Nhập họ và tên : "

# - thực hiện xóa khoảng trắng ở đầu, ở cuối, ở giữa sao cho mỗi từ cách nhau 1 khoảng trắng
input = gets.strip.squeeze(" ")

# - chữ cái đầu của tên viết hoa, còn lại chữ thường
array = input.split(" ")
first_name = array.last.capitalize
first_name1 = array.last[0].upcase
array.delete_at(-1)

# - những từ còn lại trong họ tên lấy ký tự đầu tiên, viết hoa ký tự đó
new_array = []
array.each do |word|
  new_array << word[0].upcase
end

last_name = new_array.join

puts full_name = first_name+last_name

# VD:
# ""    le thi   Tuan    Hiep   ""
# -> HiepLTT

# "" nguyen the   manh  ""
# -> ManhNT