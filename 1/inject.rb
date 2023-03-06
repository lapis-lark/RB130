def inject(arr, default_value = 0)
  memo = default_value

  for ele in arr
    memo = yield(memo, ele)
  end

  memo
end

p inject([1, 2, 3, 4, 5]) { |memo, n| memo + n }

p inject([1, 2, 3, 4, 5], 100) { |memo, n| memo + n }