# "Nhập vào chuỗi 
puts "Input"
str = gets.chomp.to_s

# - Đảo ngược chuỗi
newstr = str.reverse

# - Bỏ dấu space
clearspc = newstr.gsub(/\s+/, "")

# - kiểm tra chuỗi có phải định dạng email không 

if str.match(/\A[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-zA-Z]+\z/)            
  puts "Email"
else
  puts "fail"
end

puts newstr
puts clearspc
# *Phân biệt string và symbol

# freeze string"

 
