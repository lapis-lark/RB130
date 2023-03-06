
loop do 
  name = 'juli'
  chunk = Proc.new {puts "hi #{name}" }
  chunk.call
  break
end

chunk.call