# "Viết một chương trình quản lý điểm của học sinh. Mỗi học sinh sẽ có 3 điểm toán, văn, anh
# Bạn hãy đề xuất thiết kế các lớp đối tượng cần thiết để quản lý danh sách các học sinh trong 1 lớp
# Hãy viết chương trình thực hiện các yêu cầu sau:
# 1. Cho phép nhập thông tin điểm từng học sinh và sau đó In ra điểm trung bình cao nhất của lớp
class Student
  attr_reader :ten, :toan, :van, :anh, :avg
  def initialize(ten, toan, v, a)
    @ten = ten
    @toan = toan.to_f
    @van = v.to_f
    @anh = a.to_f
    @avg = avg
 end

 def avg
  return (@toan + @van + @anh) / 3.0
 end
end

# 2. Khởi tạo danh sách học sinh (lưu trữ trong một hash có key là tên học sinh, value chứa các điểm học sinh đó và điểm trung bình cộng).
def student_list
  students = {}
  puts "Nhập số lượng học sinh:"
  n = gets.chomp.to_i
  n.times do |i|
    puts "Nhập tên học sinh #{i+1}:"
    name = gets.chomp
    puts "Nhập điểm Toán:"
    toan = gets.chomp.to_f
    puts "Nhập điểm Văn:"
    van = gets.chomp.to_f
    puts "Nhập điểm Anh:"
    anh = gets.chomp.to_f
    
    student = Student.new(name, toan, van, anh)
    
    students[name] = {
      toan: student.toan,
      van: student.van,
      anh: student.anh,
      avg: student.avg
    }
  end
  students
end

# VD:
# {""ngoc""=>{:toan=>3, :van=>4, :anh=>5, :avg=>4.0}, ""thao""=>{:toan=>6, :van=>7, :anh=>8, :avg=>7.0}}
# 3. Dựa vào hash vừa khởi tạo ở bước 2 lấy ra tên học sinh có điểm trung bình 3 môn cao nhất
def highest_avg(students)
  max_student = nil  
  max_avg = 0  

  students.each do |name, mark|
    if mark[:avg] > max_avg
      max_avg = mark[:avg]
      max_student = name
    end
  end

  if max_student != nil
    puts "Học sinh có điểm trung bình cao nhất: #{max_student} với điểm trung bình #{max_avg}"
  else
    puts "Không có học sinh nào."
  end
end

students = student_list
highest_avg(students)


