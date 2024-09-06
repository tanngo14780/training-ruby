# "Xây dựng module Price có method min_ticket_need_sell trả về số lượng vé cần bán cho mỗi chuyến bay là 100. 
# (OUTPUT: ""You need         sell at least 100 ticket to fly"")
module Price 
  def min_ticket_need_sell
    puts "You need sell least 100 ticket to fly"
  end
end

# Xây dựng class Plane thỏa mãn những điều kiện sau:
# - Có instance method là flight_attendant in ra số lượng tiếp viên hàng không trên máy bay (số lượng tiếp viên hàng không  là tham số truyền vào) của mỗi chiếc máy bay
# (OUTPUT: ""In flight have xxx attendant"" - với xxx là tham số truyền vào
# - Có class method là max_fly_speed in ra tốc độ bay tối đa của tất cả các máy bay
# (OUTPUT: ""913 km/h"")
class Plane
  def flight_attendant(x)
    puts "In flight have #{x} attendant"
  end
  def self.max_fly_speed
    puts "913km/h"
  end
  # - Thừa kế module Price
  include Price
end

# - Tạo ra đối tượng vietnam_airline của lớp Plane và in ra màn hình thông báo số lượng tiếp viên hàng không (biết vietnam_airline có 10 tiếp viên hàng không).
vietnam_airline = Plane.new
vietnam_airline.flight_attendant(10)

# - Tạo ra đối tượng vietjet của lớp Plane và in ra màn hình thông báo số lượng tiếp viên hàng không.(biết vietjet có 20 tiếp viên hàng không).
vietjet = Plane.new
vietjet.flight_attendant(20)

# - In ra màn hình tốc độ bay tối đa của Plane.
Plane.max_fly_speed

# - In ra màn hình số lượng vé cần bán cho vietname_airline và vietjet.
vietnam_airline.min_ticket_need_sell
vietjet.min_ticket_need_sell
