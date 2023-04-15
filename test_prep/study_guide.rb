#? closures, binding, and scope
  # closure -. a reusable chunk of code
  #         -. so called because it binds the surrounding objects into a reusable environment/enclosure
  #         - in ruby, we have blocks, procs, and lambdas as closure types
  #? binding
    # keeping track of the context the object was created in
    # local variables, method references, constants, and more that is accessible when
    # procs are defined are tracked by them; they track a reference to the original object
    # not a copy (pass by value style)

  #? scope
    # closures create a new scope
    # procs retain references to the local scope in which they were created
    # methods, local vars, constants, and more defined above them will be referenceable 
    # regardless of where the proc is called


#? how blocks work, use cases
  # Two basic use cases:
    # increasing flexibility of method, allowing user to tweak what they want with a block
      # methods like #select, #map, etc. are useful because of their flexibility; many smaller methods don't need to be memorized
    # creating 'sandwich' code methods, i.e. those with clear before and after steps
      # for example, a method that times how long something takes, one that opens and closes files automatically (File::open) 


#? method using block
[1, 2, 3].map { |n| n.odd? } # -> [true, false, true]

#? method using proc
[1, 2, 3].map do |n|
  even = :even?.to_proc
  even.call(n)
end # [false, true, false]

#? methods and blocks can return closures
  # this can be done by returning either a proc or a lambda
    # for example:
    def sequence
      counter = 0
      Proc.new { counter += 1 }
    end
    
    s1 = sequence
    p s1.call           # 1
    p s1.call           # 2
    p s1.call           # 3
    puts
    
    s2 = sequence
    p s2.call           # 1
    p s1.call           # 4 (note: this is s1)
    p s2.call           # 2
  
    #? #sequence returns a `Proc` when called; this Proc is bound to its local environment
    #? this includes local var `counter`; a new local var counter is initialized each time `#sequence` is called

#? methods with an explicit block parameter
  # use the & operator to specify in argument list?
    # useful because it assigns the block to a variable, in turn allowing it to be passed to another method


#? arguments and return values with blocks
  # blocks and procs both have lenient arity (providing more or less arguments than they have parameters for does not raise an error)
  # return values are similar to methods; the last evaluated expression is returned; 

  h = 'hello'
  def test(str)
    yield(str)
  end

  p test(h) do |str, a, b| # passing in fewer arguments to this block than it specifies is allowed (lenient arity)
    p a # uninitialized, so returns nil
    p b
    str.upcase! # mutates the caller from within block, just as methods can
  end # last evaluated expression in block returned, like with methods

  p h  # h mutated




#? &:symbol
  # when passing &:method_name into a method, ruby first tries to convert the symbol to a block
  # the symbol is not a proc, so first Symbol#to_proc is called on the symbol;
  # the proc can now be converted to a block
  # procs themselves cannot be used in place of blocks but must be converted to them 
  # with the & operator

def test
  yield 2
end
x = :even?.to_proc
test(x) # returns an argument error; Procs are objects and therefore treated as arguments, not block
test(&x) # returns 'true'

#? arity of blocks and methods
 # methods and lambdas have strict arity; blocks and procs have lenient arity
 # strict = mismatched number of arguments provided vs. parameters raises an error
 # lenient = no error thrown, uninitialized vars == nil

#? testing terminology
  # test suite
    # the entire set of tests for a project
  # test
    # a general feature or context for which one or more assertions may be run
  # assertion
    # the verification that the expected data is what the program output; may be multiple per test
  

#? minitest vs rspec
  # capable of the exact same functionality as each other
  # minitest has simpler, more straightforward syntax; rspec has a dsl (Domain specific language)
  # this DSL results in more natural english but is more complicated
  # Minitest has more basic ruby and DSL capability

#? SEAT approach
  # S: setup
  # E: execute
  # A: assert
  # T: teardown

#? Assertions (write an assertion)
  # most useful assertions:
    # assert(test) -> fails unless truthy
    # assert_equal(exp, act) -> fails unless exp == act
    # assert_nil
    # assert_raises
    # assert_instance_of(cls, obj)
    # assert_includes(collection, obj)

#* Purpose of core tools
  # Core Tools:
    # Minitest/RSpec
      # testing! 
    # Rake
      # automating common tasks 
      #*
      #*
    # Bundler
      # specifies the versions of gems and ruby needed for your project
      # Gemfile 
        #*
      # Gemfile.lock
        #*
    # rbenv/rvm
      # manages which version of ruby one is using

#* Gemfiles
  # purpose -> specifying the libraries you need access to for your project, as well as the version or range of versions acceptable
  # usage

