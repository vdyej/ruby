def bubble_sorter(arr)
  p arr
  for y in (1..arr.length) do
    for x in (0..arr.length-2) do
      if arr[x] > arr[x+1]
        arr[x], arr[x+1] = arr[x+1], arr[x]
      end
    end
    p arr
  end
  return arr
end

arr = Array.new(20) {rand(10000)}
bubble_sorter(arr)