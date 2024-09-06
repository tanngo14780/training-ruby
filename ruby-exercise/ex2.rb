# Khởi tạo một mảng gồm n số tự nhiên sau đó
# hiển thị các dãy con tăng dần trong mảng.
array = [1, 2, 5, 4, 6, 3, 8, 9, 10]
c = 0
arr = []
arr << array[c]
begin
  if array[c] <= array[c + 1]
    arr << array[c + 1]
  else
    puts "[#{arr.join(", ")}]"
    arr = []
    arr << array[c + 1] 
  end
  c += 1
  if c == array.length - 1
    puts "[#{arr.join(", ")}]"
  end
end while c < array.length - 1

# NOTE: In ra các dãy con liên tiếp tăng dần

# ex:
# input: [5,3,6,7,8,3,4,7,0,1,3,2,8]
# output: [3,6,7,8] , [3,4,7], [0,1,3], [2,8]
