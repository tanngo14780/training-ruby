# Có 1 mảng các hash như sau:
array =  [{"Hanoi": ["CauGiay", "vung xanh"] }, {"Hanoi" => ["LongBien", "vung do"]}, {"Hanoi" => ["Metri", "vung xanh"]}]

# Biến đổi về các dạng:
# {""vung xanh"": [""Cau Giay - Hanoi"", ""Metri - Hanoi""], ""vung do"": [""LongBien - Hanoi""] }
covid = {"vung xanh":[],"vung do":[]}

def check(hash1, hash2)
  array = hash1.values.flatten
  puts array[0], hash1.keys
  if array[1].to_s == "vung xanh"
    location = "#{array[0]} - #{hash1.keys[0]}"
    hash2[:"vung xanh"] << location
  else
    location = "#{array[0]} - #{hash1.keys[0]}"
    hash2[:"vung do"] << location
  end

end
array.each do |i|
  check(i, covid)
end
puts covid
