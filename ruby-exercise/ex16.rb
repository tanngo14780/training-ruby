class SalaryCalculator
  LUONG_CO_BAN = 3000
  HE_SO_LUONG_OT = 1.5
  def initialize
    @time = 0
    @time_ot = 0
  end

  def set_time(time, time_ot)
    @time = time
    @time_ot = time_ot
  end

  def calculate
    raise NotImplementedError, "Các class con chưa thực hiện tính toán"
  end
end

class DevSalary < SalaryCalculator
  HE_SO_LUONG  = 1.15
  def calculate
    luong_ot = @time_ot * LUONG_CO_BAN *  HE_SO_LUONG_OT
    (LUONG_CO_BAN * @time * HE_SO_LUONG ) + luong_ot
  end
end

class QASalary < SalaryCalculator
  HE_SO_LUONG  = 1.1
  def calculate
    luong_ot = @time_ot * luong_co_ban *  HE_SO_LUONG_OT
    (LUONG_CO_BAN * @time * HE_SO_LUONG ) + luong_ot
  end
end

class DefaultSalary < SalaryCalculator
  def calculate
    LUONG_CO_BAN * @time
  end
end

class Employee
  attr_accessor :name, :manv, :bophan, :luong, :time, :time_ot

  def initialize(ten, manv, bophan)
    @ten = ten
    @manv = manv
    @bophan = bophan
    @time = 0
    @time_ot = 0
    @salary_calculator = create_salary_calculator
  end

  def work_hours(time, time_ot = 0)
    @time = time
    @time_ot = time_ot
    calculate_salary
  end

  def salary
    @luong
  end

  private

  def calculate_salary
    @luong = @salary_calculator.calculate
  end

  def create_salary_calculator
    case @bophan
    when "Dev"
      DevSalary.new(@time, @time_ot)
    when "QA"
      QASalaryr.new(@time, @time_ot)
    else
      DefaultSalary.new(@time, @time_ot)
    end
  end
end


# Khi khởi tạo danh sách nhân viên
employee_list = []
puts "Có bao nhiêu nhân viên: "
num_employees = gets.chomp.to_i
num_employees.times do
  puts "Nhập tên nhân viên: "
  name = gets.chomp.to_s
  puts "Nhập mã nhân viên: "
  employee_id = gets.chomp.to_s
  puts "Nhập bộ phận: "
  department = gets.chomp.to_s
  puts "Nhập thời gian làm việc(h): "
  work_hours = gets.chomp.to_f
  if department == "Dev" || department == "QA"
    puts "Nhập thời gian OT(h) "
    overtime_hours = gets.chomp.to_f
  else
    overtime_hours = 0
  end
  employee = Employee.new(name, employee_id, department)
  employee.work_hours(work_hours, overtime_hours)
  employee_list << employee
end

# Hiển thị toàn bộ thông tin nhân viên
employee_list.each do |employee|
  puts "Tên: #{employee.ten}, Mã: #{employee.manv}, Bộ phận: #{employee.bophan}, Lương: #{employee.luong}, Thời gian OT: #{employee.time_ot}, Thời gian làm việc: #{employee.time}"
end

# Lấy ra mã nhân viên có số lương > 5000
CHECK_POINT = 5000
employee_list.each do |employee|
  if employee.luong > CHECK_POINT
    puts "Mã: #{employee.manv}, Lương: #{employee.luong}"
  end
end

# Thêm mới 1 nhân viên vào danh sách nhân viên hiện có
def add_employee(employee_list, new_employee)
  employee_list.clone << new_employee
end

# Thêm mới nhân viên
new_employee = Employee.new(name, employee_id, department)
new_employee.work_hours(work_hours, overtime_hours)
employee_list = add_employee(employee_list, new_employee)
