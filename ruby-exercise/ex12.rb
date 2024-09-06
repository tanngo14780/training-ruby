def validate_time (check_in, check_out)
  format = /\A\d{2}:\d{2}\z/
  if check_in.match(format) &&  check_out.match(format)
    return "Dữ liệu hợp lệ "
  else
    return "Dữ liệu không hợp lệ "
  end
end

#Chuyển sang phút
def minutes(time)
  array = time.split(":").map {|e| e.to_i}
  minute = array[0]*60 + array[1]
  return minute
end

#Tính giờ OT
def ot(check_in, check_out)
  validate_time(check_in, check_out)
  time_check_in = minutes(check_in)
  time_check_out = minutes(check_out)
  time_ot = (time_check_out - time_check_in).to_f 
  return time_ot/60
end

#Trợ cấp
def allowance(check_in, check_out)
  time_ot = ot(check_in, check_out)
  lunch = if minutes(check_in) < 12 * 60 && minutes(check_out) > 13*60 && time_ot > 4
    time_ot -= 1.0
     "Y"
  else
    "N"
  end
  dinner = if time_ot > 3 &&  minutes(check_out) > 21*60
    "Y"
  else
    "N"
  end
  puts "OT: #{time_ot.round(2)}, Lunch: #{lunch}, Dinner: #{dinner}"
end
check_in = '12:30'
check_out = '21:45'
allowance(check_in, check_out)