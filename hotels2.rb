n, m = gets.chomp.split(' ').map(&:to_i)
hotel_prices = gets.chomp.split(' ').map(&:to_i)

closest = 0   # The closest value to M (amount of money)
sum = 0 # Sum of the range
min_index = 0  # Begining of the range
(0..n - 1).each do |max_index|  # End of the range
  if hotel_prices[max_index] > m
    sum = 0
    min_index = max_index + 1
  else
     sum += hotel_prices[max_index]
     if sum > m
       begin
         sum -= hotel_prices[min_index]
         min_index += 1
       end while sum > m
     end
     if closest <= sum
       closest = sum
       break if closest == m
     end
  end
end

puts closest
