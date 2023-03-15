=begin
  IN: arr of ints
  OUT: biggest element by return value of block
  DATA:  array of value and its return value from block

  ALGO: create a variable to house array of biggest element and its return value
        iterate over array, pass each val to block
        if return value of block bigger, replace biggest array with that
=end

def max_by(arr)
  return nil if arr.empty?
  biggest = [arr[0], yield(arr[0])]
  arr[1..-1].inject(biggest) do |big, ele|
    val = yield(ele)
    result = (big[1] < val ? [ele, val] : big)
  end.first
end

p max_by([1, 5, 3]) { |value| value + 2 } #== 5
p max_by([1, 5, 3]) { |value| 9 - value } #== 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } #== 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } #== [3, 4, 5]
p max_by([-7]) { |value| value * 3 } #== -7
p max_by([]) { |value| value + 5 } #== nil