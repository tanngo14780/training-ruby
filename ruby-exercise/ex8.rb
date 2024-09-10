a = [2, 20, 1, "/a", "/c"]
b = [1, "/c/a/", "/b", "/a", 50]
c = 1

contains_c = b.include?(c)

puts contains_c

# b, Viết hàm lấy ra những phần tử có trong cả 2 mảng.
# OUTPUT: 
# [1, ""/a""]
d=[]
d = a & b

puts d.inspect
# c, Viết hàm lấy ra những phần tử chỉ có trong mảng a mà không có trong mảng b.
# OUTPUT: 
# [2, 20, ""/c""]"
e=[]
e = a - b
puts e.inspect
