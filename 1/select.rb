def select(arr)
  selected = []
  
  for ele in arr
    selected << ele if yield(ele)
  end

  selected
end

p select([1, 2, 3, 4, 5]) { |n| n.odd? }

p select([1, 2, 3, 4, 5]) { |n| n }