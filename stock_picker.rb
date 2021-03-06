#creates random integer array of 10 numbers for test purposes
arr = Array.new(10) {rand(1..100)}

#displays the 10 day totals as an array
p arr

#initializes best profit as 0
best = 0

for y in (0..8)
  for x in ((y+1)..9)
    diff = arr[x] - arr[y]
    p "The difference between #{arr[x]} and #{arr[y]} is #{diff}"
    if diff > best
      best = diff
      p "The new best difference is #{best}"
      best_sell_value = arr[x]
      best_buy_value = arr[y]
      best_sell_day = x
      best_buy_day = y
    end
  end
end
p "You should buy on day #{best_buy_day} at $#{best_buy_value} and sell on day #{best_sell_day} at $#{best_sell_value} for a profit of $#{best}"