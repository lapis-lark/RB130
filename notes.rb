# LESSON !: BLOCK

# CLOSURES (have BINDINGS)
=begin
  CLosures are a general programming concept; the term refers to a chunk of code
  that can be reused and passed around. 

  In Ruby, there are three different types of closures: Proc objects, lambdas, and blocks

  Closures can be particularly handy for passing into methods. They reference their
  surroundings, something known as a BINDING.

  Blocks are essentially special ARGUMENTS to method calls, and are therefore passed into the calling method.

  However, unlike arguments, every method can take an optional block without returning
  an error. Whether the method uses the block at all or not is another question.

  `yield` is the keyword to invoke the block called with a method
  
  An advantage of blocks is allowing other developers to add in additional code to a method
  without modifying the method itself at all.

  Allow for optional blocks with Kernel#block_given?

  block parameters become "block local variables", a special type of local var restricted
  to blocks

  blocks allow for additional, optional functionality that can be added by programmers
  as needed

  blocks and procs have lenient ARITY, meaning that no error is thrown when you pass in
  too many or too few arguments. methods and lambdas, however, have strict ARITY.

  2 PRIMARY USE CASES: defer some code until method invocation for flexibility
                        writing sandwich code (methods where specific before/after actions
                        are fixed but the middle needs to be flexible [like File::open])
  
  

  Closures keep track of the variables they are bound to at the time of their instantiation
  This is their BINDING.
  Variables named within closures that are not yet instantiated must be passed into them 
  explicitly when they are called. 
=end