night_shifts = ["josh", "andrew", "sal", "casey", "beth", "ilana", 
"lauren", "sal", "casey", "casey", "nate", "beth", "nate", "nate", 
"casey", "casey", "casey", "andrew"]

def create_hash(names)
  name_map = Hash.new
  for name in names do
    if name_map.has_key? (name)
      counter = name_map[name]
      name_map[name] = counter + 1
    else
      name_map[name] = 1
    end
  end
  return name_map
end

def print_shift_count(names)
  num_shifts = 6

  while num_shifts > 0 do
    keys = get_keys(names, num_shifts)
    print_shift_array(keys, num_shifts)
    num_shifts -= 1
  end
end

def print_shift_array(arr, num)
  arr.each do |key|
    name = key[0]
    puts "#{name} worked #{num} night shifts."
  end
end

def get_keys(names, num)
  keys = names.select do |key, value|
    value == num
  end
end



names = create_hash(night_shifts)
puts "#{names}"

print_shift_count(names)