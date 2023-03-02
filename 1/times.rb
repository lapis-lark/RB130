def times(n)
  (0..(n - 1)).each { |num| yield num}
  n
end

def times(n)
  for i in (0..(n - 1))
    yield i
  end
  n
end

times(5) { |num| puts num}