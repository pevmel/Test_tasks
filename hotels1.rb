$n, m = gets.chomp.split(' ').map(&:to_i)
hotel_prices = gets.chomp.split(' ').map(&:to_i)

$sum_vals = []
s = 0
hotel_prices.each do |v|
  s += v
  $sum_vals << s
end

def get_next_index from, next_value
  (from..$n - 1).each do |v|
    return v - 1 if $sum_vals[v] > next_value
    return v if $sum_vals[v] == next_value
  end
  return $n - 1
end

closest = 0   # The closest value to M (amount of money)
start = 0   #  Value of the first element in the range
max_index = 0 #  Index of the last element in the searching range
(0..$n - 1).each do |min_index| #  Index of the first element in the searching range
  if $sum_vals[min_index] <= m + start
    max_index = get_next_index max_index, m + start
    if $sum_vals[max_index] - m == start
      closest = m
      break
    end
    c = $sum_vals[max_index] - start
    if closest <  c
      closest = c
    end
  end
  start = $sum_vals[min_index]
end

puts closest
