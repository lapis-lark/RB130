=begin
  closures: what and why?

  a closure is a general programming concept referring to a reusable chunk of code
  in ruby, there are three types of closures: blocks, procs, and lambdas


  closures and binding


  closures and scope  (procs/lambdas and scope?)


  how do blocks work?
    
    every method in ruby can take a block implicitly (though it doesn't need to use it)
    methods use blocks by yielding to them with the `yield` keyword
    yielding without block gives error, so use Kernel#block_given? for optional blocks
    you can yield with arguments
    blocks (and procs) have lenient arity, so yielding more or less arguments than
    the block specifies is allowed; extras will be ignored, and unsupplied parameters will
    be `nil`.



  use cases of blocks (2)
    writing methods with more flexibility to their use or when not sure exactly what the
    user will need
    writing methods that have fixed before and after actions (such as closing and opening a file)
    File::open does exactly this when given a block.



  what is arity? why does it matter? what type of arity do each of the closures have?
    arity refers to the rule about the number of arguments passed to methods and blocks
    lenient arity means there can be more or less arguments without throwing an error
    strict arity means an error will be raised if there are more or less args

    methods and lambdas have strict arity
    blocks and procs have lenient arity

  how do you write a method with an explicit block parameter? why do this?
    def test(&block)
      puts "What's &block? #{block}"
    end

    Explicit blocks are referenceable with a variable, allowing more flexibility in their use.
    Blocks can then be passed to other methods.
    Explicit blocks are converted to simple procs. 

  What are the two ways the `&` operator is used?
    1. creating an explicit block parameter in a method
    2. convert a symbol to a proc (for passing into a method typically)

  
  What are the important things to know about closure scope? (X things)
    1. closures retain references to the local variables, methods, etc. from the 
    location they are created. this is known as their 'binding'



  Testing terminology:

  test suite vs. test vs. assertion

    test suite: the entire set of tests that accompanies your program or application; all the tests
    test: a specific feature or ability about which tests are run; can contain multiple assertiosn
    assertion: the verification step that the expected data is in fact returned by the program; tests contain one or more of these

  

  common assertions (7) and their uses:
    assert
    assert_equal(exp, act)
    assert_same(exp, act)
    assert_nil
    assert_raises(*exp) { . . . }
    assert_instance_of(cls, obj)
    assert_includes(collection, obj)

    there are refutations for each assertion, though these are rarely used

  SEAT approach steps
    Set up recurring objects (runs before each test)
    Execute code 
    Assert whether the code did the right thing or not
    Tear down lingering structures (runs after each test)


  Minitest vs. RSpec
    Minitest and RSpec are functionally equivalent
    However, RSpec uses a domain specific language (DSL) to make it read more like English (at the expense of begin substantially more complicate)
    Miinitest, however, reads like regular Ruby :)

  Purpose of core tools:
    Rubygems: packages of code that you can download and use in your programs or from command line

    RVM/RBenv: ruby version managers; certain projects rely on features specific to one version of ruby, so switching ruby version easily is important

    Bundler: a dependency manager for ruby; like version managers for ruby, but for ruby gems instead

    uses a Gemfile to tell it which version of ruby and gems to uses; DSL used in the Gemfile

    then run "bundle install" to install necessary gems and create a Gemfile.lock file with information about everything installed

    Rake: a gem that automates common tasks for building, testing, packaging, installing programs; automatically installed

    Minitest/Rspec: testing libraries! ensures everything working, including after changes to the project

  end