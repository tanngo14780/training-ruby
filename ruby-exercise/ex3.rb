#cho 1 Hash quản lí ID và name (tự khai báo). Nhập ID, trả name ra màn hình và ngược lại	
hash = {101 => "A", 102 => "B", 103 => "C", 104 => "D"}

puts "Tên của mã ID là #{hash[101]}"
puts "Mã ID của người tên B là #{hash.key("B")}"
