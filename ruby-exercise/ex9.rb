module Price 
  def min_ticket_need_sell
    puts "You need sell least 100 ticket to fly"
  end
end

class Plane
  MAX_FLY_SPEED = "913 km/h"

  def flight_attendant(x)
    puts "In flight have #{x} attendant"
  end

  def self.max_fly_speed
    puts MAX_FLY_SPEED
  end

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
