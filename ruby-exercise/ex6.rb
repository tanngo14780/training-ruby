require 'json'
# "Viết ứng dụng quản lí máy tính  
# Lưu thông tin user, máy tính qua 1 file json / csv
# $Data = {
#   "user" =>[
#     {
#       "username" => "a",
#       "password" => "1",
#       "role" => "user"
#     },
#     {
#       "username" => "admin",
#       "password" => "1",
#       "role" => "admin"
#     }
#   ],  
#   "com" => [
#     {"Computer 1"=> "10/h"},
#     {"Computer 2"=> "12/h"}
#   ]
# }

# def write_data(data)
#   File.open('data.json','w') do |f|
#     f.write(JSON.pretty_generate(data))
#   end
# end

active = false
role = ""
$Data = JSON.parse(File.read('data.json'))
$user_data= $Data['user']
$com_data = $Data['com']

#find
def find_comp(query)

  found = false
  $com_data.each do |comp|
    if comp.include?(query)
      return comp[query]
      found = true
      break
    end
  end
  if found == false 
    return "Not exist"
  end
end

def find_user(query)
  $Data["user"].each do |user|
    return user if user["username"] == query
  end
  return "Not exist"
end

#add new
def add_new(type)
  if type == "com"
    puts "Nhập tên thiết bị"
    key = gets.chomp
    puts "Nhập giá"
    price = gets.chomp
    $Data['com'] << {key => price}
    puts $Data['com']
    write_data($Data)
  else
    puts "Nhập tên username"
    username = gets.chomp.to_s
    puts "Nhập password"
    password = gets.chomp.to_s
    role = "user"
    newuser = {
      "username" => "#{username}",
      "password" => "#{password}",
      "role" => "#{role}"
    }
    $Data['user'] << newuser
    puts $Data['user']
    write_data($Data)
  end
end

#edit
def edit(type)
  if type == "com"
    puts "Computer name : "
    query = gets.chomp.to_s 
    if find_comp(query).to_s != "Not exist"
      puts "New price = "
      new_price = gets.chomp.to_s      
      $Data['com'].each do |com|
        if com.keys.first == query
          com[query] = new_price
          puts "Updated"
          break
        end
      end
      write_data($Data)
    else
      puts "Invalid computer name"
    end
  elsif type == "user"
    puts "Username :"
    query = gets.chomp.to_s    
    user = find_user(query)
    if user != "Not exist"
      puts "New password:"
      new_password = gets.chomp.to_s
      user["password"] = new_password
      puts "Password updated"
      write_data($Data)
    else
      puts "User not found."
    end
  else
    puts "Invalid type"
  end
end

#delete
def delete(type)
  if type == "com"
    puts "Computer name : "
    query = gets.chomp.to_s
    comp_delete = find_comp(query)
    puts comp_delete
    if comp_delete != "Not exist"
      $Data['com'].delete(comp_delete)
      puts "Computer #{query} deleted "
    else
      puts "Computer not found."
    end
  elsif type == "user"
    puts "Username : "
    query = gets.chomp.to_s
    user_delete = find_user(query)

    if user_delete != "Not exist"
      $Data['user'].delete(user_delete)
      puts "User #{query} deleted "
    else
      puts "User not found."
    end
  else
    puts "Invalid type"
  end
end

# Nếu là Admin thì cho sử dụng các chức năng
# - thêm, sửa, xoá, search      info máy tính
# - thêm sửa xioá user
def admin 
  puts "Admin Board"
  puts "1. Add new computer " #
  puts "2. Edit price computer" # 
  puts "3. Delete Computer"
  puts "4. Find Computer" #
  puts "5. Add new user" #
  puts "6. Edit profile user"#
  puts "7. Delete user"
  query = gets.chomp.to_i
  case query
  when 1
    add_new("com")
  when 2
    edit("com")
  when 3
    delete("com")
  when 4
    puts "Nhập thông tin máy tính cần tìm" 
    query = gets.chomp.to_s
    puts "Price : #{find_comp(query)}"
  when 5
    add_new("user")
  when 6
    edit("user")
  when 7
    delete("user")
  else "Another"
  end

end

# Nếu là User thì cho sử dụng các chức năng
# - search info máy tính"
def user 
  puts "Nhập thông tin máy tính cần tìm" 
  query = gets.chomp.to_s
  puts "Price : #{find_comp(query)}"
end

# - Đăng nhập > nhập user/pass >  kiểm tra trong file json
puts "Enter username "
username = gets.chomp
puts "Enter password "
password = gets.chomp

$user_data.each do |user|
  if user['username'].to_s == username && user['password'].to_s == password
    active = true
    role = user['role'].to_s
    puts "Login Successfull"
    break
  end
end

# - kiểm tra quyền của user
if active
  if role == "admin"
    admin
  elsif role == "user"
    user   
  else
    puts "Invalid role"
  end
else
  puts "Login failed"
end





