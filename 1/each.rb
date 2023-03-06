def each(arr)
  for ele in arr
    yield ele
  end

  arr
end

each(%w(a b c)) { |l| puts l}