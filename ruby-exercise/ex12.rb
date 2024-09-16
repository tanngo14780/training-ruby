def valid_time_format(check_in, check_out)
  format = /\A\d{2}:\d{2}\z/
  if check_in.match(format) && check_out.match(format)
    return "Dữ liệu hợp lệ"
  else
    return "Dữ liệu không hợp lệ"
  end
end

def minutes(time)
  array = time.split(":").map(&:to_i)
  minute = array[0] * 60 + array[1]
  minute
end

def ot(check_in, check_out)
  valid_time_format(check_in, check_out)
  time_check_in = minutes(check_in)
  time_check_out = minutes(check_out)
  time_ot = (time_check_out - time_check_in).to_f 
  time_ot/60
end

def allowance(check_in, check_out)
  overtime_hours = ot(check_in, check_out)
  lunch = if minutes(check_in) < 12 * 60 && minutes(check_out) > 13 * 60 && overtime_hours > 4
    overtime_hours -= 1.0
    "Y"
  else
    "N"
  end
  
  dinner = if overtime_hours > 3 && minutes(check_out) > 21 * 60
    "Y"
  else
    "N"
  end
  
  puts "OT: #{overtime_hours.round(2)}, Lunch: #{lunch}, Dinner: #{dinner}"
check_in = '12:30'
check_out = '21:45'
allowance(check_in, check_out)