require 'pry'

hash_bonanza = {
  key_1: {
    key_2: {
      key_3_a: {
        key_4: "found me!"
      },
      key_3_b: "not quite"
    }
  }
}

def find_depth(hash)
  result = find_depth_recursive(hash)
end

def find_depth_recursive(hash)
  return 1 if hash.class == String
  ans = 1
  hash.each do |key, value|
    return ans + find_depth_recursive(value)
  end
  binding.pry
end

number = find_depth(hash_bonanza)
puts number