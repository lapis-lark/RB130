=begin
  IN: two arrays of same number of ele
  OUT: single array of arrays (0 indexes, then 1 indexes, ...)

  DATA: Arrays
  ALGO: create new array
        iterate over one array
        add paired arrays to new array
        return new array
=end

def zip(arr1, arr2)
  zipped = []
  for i in (0...arr1.size)
    zipped << [arr1[i], arr2[i]]
  end

  zipped
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]