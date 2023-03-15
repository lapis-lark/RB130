def each_cons(arr)
  (0...(arr.size - 1)).each do |i|
    yield(arr[i], arr[i + 1])
  end
  nil
end
=begin
  IN: array, consecutive elements to pass to block
  OUT: nil?
  DO: pass in x cons elements until the full number cannot be passed in

  DATA: 
  ALGO: set up vars to track first and last index
        return if last out of range
        pass slice of arr into block
        increment first and last 1
=end


def each_cons(arr, cons)
  first = 0
  last = cons - 1

  arr.each do |ele|
    return if arr[last].nil?
    yield(ele, *arr[first..last][1..-1])
    first += 1
    last += 1
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}