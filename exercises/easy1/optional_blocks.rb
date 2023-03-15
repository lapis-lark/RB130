def compute(c)
  block_given? ? yield(c) : "Does not compute."
end

p compute(1) { |c| 5 + 3 + c} 
p compute('d') { |c| 'a' + 'b' + c}
p compute('howdy') == 'Does not compute.'