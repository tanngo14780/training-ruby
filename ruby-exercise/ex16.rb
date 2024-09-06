# "Viết chương trình quản lý nhân viên như sau:
# Đây là 1 công ty về công nghệ thông tin.
# Trong 1 công ty, Mỗi nhân viên sẽ có tên và mã nhân viên và bộ phận làm việc của nhân viên
# Công ty sẽ có các bộ phận như: dev, qa, BO, infra

# Do tính chất công việc ở mỗi bộ phận khác nhau, nên sẽ có cách tính lương riêng:
# + Dev: Lương cơ bản * số giờ  và được hỗ trợ thêm 15% lương
# + Tester: Lương cơ bản * số giờ  và được hỗ trợ thêm 10% lương
# + Các nhân viên khác: Lương cơ bản * số giờ 
# * giả sử lương cơ bản ở đây là 3000

# Ngoài ra, chỉ có nhân viên thuộc bộ phận QA và Dev mới được phép request OT
# Công thức tính request OT là: Số giờ OT * 150% của lương cơ bản

# Bạn hãy đề xuất thiết kế các lớp đối tượng cần thiết để quản lý danh sách các nhân viên của công ty và hỗ trợ tính lương cho nhân viên theo tiêu chí đặt ra như trên.
# Hãy viết chương trình thực hiện các yêu cầu sau:


class Employee
  attr_accessor :ten, :manv, :bophan, :luong, :time_ot, :time
  def initialize(ten, manv, bophan, ot, time)
    @ten = ten
    @manv =manv
    @bophan = bophan
    @time_ot = ot
    @time = time
  end

  def salary
    case @bophan
    when "Dev"
      luong_ot = @time_ot * 3000 * 1.5 
      @luong = (3000 * @time * 1.15) + luong_ot 
    when "QA"
      luong_ot = @time_ot * 3000 * 1.5 
      @luong = (3000 * @time * 1.1) + luong_ot 
    else
      @luong = 3000 * @time
    end
  end

end


# 1. Khởi tạo danh sách nhân viên (lưu trữ trong một mảng duy nhất).
emp_list =[]
puts "Có bao nhiêu nhân viên: "
n = gets.chomp.to_i
n.times do 
  puts "Nhập tên nhân viên: "
  name = gets.chomp.to_s
  puts "Nhập mã nhân viên: "
  manv = gets.chomp.to_s
  puts "Nhập bộ phận: "
  bophan = gets.chomp.to_s
  puts "Nhập thời gian làm việc(h): "
  time = gets.chomp.to_f
  if bophan == "Dev" || bophan == "QA"
    puts "Nhập thời gian OT(h) "
    ot_time = gets.chomp.to_f
  else
    ot_time = 0
  end
  emp = Employee.new(name, manv, bophan, ot_time, time)
  emp.salary
  emp_list << emp
end

# 2. Hiển thị toàn bộ thông tin nhân viên
emp_list.each do |emp|
  puts "Tên: #{emp.ten}, Mã: #{emp.manv}, Bộ phận: #{emp.bophan}, Lương: #{emp.luong}, Thời gian OT: #{emp.time_ot}, Thời gian làm việc: #{emp.time}"
end
# 3. Lấy ra mã nhân viên có số lương > 5000
emp_list.each do |emp|
  if emp.luong > 5000
    puts "Mã: #{emp.manv}, Lương: #{emp.luong}"
  end
end
# 4. Thêm mới 1 nhân viên vào danh sách nhân viên hiện có"
def add_employee(emp_list)
  puts "Nhập tên nhân viên: "
  name = gets.chomp.to_s
  puts "Nhập mã nhân viên: "
  manv = gets.chomp.to_s
  puts "Nhập bộ phận: "
  bophan = gets.chomp.to_s
  time = 0
  ot_time = 0

  emp = Employee.new(name, manv, bophan, ot_time, time)
  emp_list << emp
end

add_employee(emp_list)
