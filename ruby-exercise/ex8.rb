# "Cho 2 mảng sau: 
a = [2, 20, 1, "/a", "/c"]
b = [1, "/c/a/", "/b", "/a", 50]
c = 1
# a, Viết câu lệnh kiểm tra mảng b có chứa c không?
# OUTPUT: 
# true
b.each do |e|
  if e == c
    puts "TRUE"
  end
end

# b, Viết hàm lấy ra những phần tử có trong cả 2 mảng.
# OUTPUT: 
# [1, ""/a""]
d=[]
a.each do |a|
  b.each do |b|
    if a == b
      d << a
    end
  end
end

puts d.inspect
# c, Viết hàm lấy ra những phần tử chỉ có trong mảng a mà không có trong mảng b.
# OUTPUT: 
# [2, 20, ""/c""]"
e=[]
a.each do |a|
  found = false
  b.each do |b|
    if a == b
      found = true
      break
    end
  end
  if found == false
    e << a
  end
end
puts e.inspect
