# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat', 'dog')
=begin
  Procs accept any number of arguments (0+) and will run regardless
  (lenient arity)
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_second_lambda.call('dog')
my_lambda.call('cupcake')
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
=begin
  lambdas require the exact number of arguments expected
  (strict arity)
  lambdas are functionally equivalent to Procs except for the arity
  Lambda.new fails because it is actually Proc.new called with the Kernel#lambda
=end

# Group 3
def block_method_1(animal)
  yield(animal) if block_given?
end
# can't yield to block if no block given
# does not pass arguments to block unless specified

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# 'seal' yielded to block, assigned to parameter seal, outputs appropriately
block_method_1('seal')
# no block given, so no yield

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal.class}."
end
# blocks have lenient arity, so not being passed a value for seal is not a problem
# seal is instead nil
block_method_2('turtle') { puts "This is a #{animal}."}
# the block has no parameter for animal, so a NameError is thrown since animal does
# not exist when a reference to it is attempted

=begin
  Procs and blocks have lenient arity (they kinda rhyme, it helps). That is to say,
  they can be passed any number of arguments regardless of how many they do or do
  not expect. Lambdas are just procs with strict arity (the number of parameters it has)
  is how many arguments must be passed to it without an error being thrown.

  
=end