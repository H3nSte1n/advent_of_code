def get_most_common_binary_from_array(binary_array)
  hash = {}

  binary_array.each do |binary_number|
    binary_number.to_s.each_char.with_index do |binary, index|
      new_hash = Hash[
        binary,
        hash[index].nil? ? 1 : hash[index][binary] = hash[index][binary].to_i + 1
      ]
      hash[index] = hash[index].nil? ? new_hash : { **hash[index], **new_hash }
    end
  end

  hash.map { |_, binary_hash| binary_hash.max_by { |_,value| value }[0] }.join()
end

def invert_binary_number(binary_number)
  binary_number.to_s.each_char.map { |binary| binary == '1' ? '0' : '1' }.join()
end

def power_consumption(binary_array)
  gamma_rate = get_most_common_binary_from_array(binary_array)
  epsilon_rate = invert_binary_number(gamma_rate)

  gamma_rate.to_i(2) * epsilon_rate.to_i(2)
end