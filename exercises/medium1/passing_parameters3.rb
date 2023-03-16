items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*three, last|
  puts three.join(', ')
  puts last
end

gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

gather(items) do |first, *last|
  puts first
  puts last.join(', ')
end

gather(items) do | first, second, third, last|
  puts [first, second, third, last].join(', ')
end