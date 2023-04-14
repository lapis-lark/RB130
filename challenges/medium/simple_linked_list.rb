=begin 
  PROBLEM:
    create a simple linked list class and element class
      ELEMENT:
        contains a datum (int 1-10)
        points to next element location (nil by default)
        methods:
          #next - returns next element (nil if none)
          #tail? - returns true if @#next returns nil
          #datum - returns the value fo the element
      SIMPLELINKEDLIST:
        methods:
          #new - 
          #size
          #empty?
          #push
          #peek - returns datum of first(?) element; nil if none
          #head - return top of list
          #pop - remove + return top element
          #reverse
          #to_a - convert to arr
          #from_a(arr) - arr to list


  EXAMPLES:

  DATA:
    Element
    LinkedList
    Array
    Ints
  ALGO:
    set up Element class and methods, test
    set up linked list class and methods that don't use to_a
    to_a and from_a
    remaining methods

=end

class Element
  def initialize(datum = nil, lower_ele = nil)
    @datum = datum
    @lower_ele = lower_ele
  end

  attr_accessor :datum

  def next
    @lower_ele
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @head = nil
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def to_a
    arr = []
    current = head
    until current.nil?
      arr << current.datum
      current = current.next
    end
    arr
  end

  def from_a(arr)
    next_ele = nil
    arr.reverse_each do |e|
      self.head = Element.new(e, next_ele)
      next_ele = head
    end

    self
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    return list if arr.nil?
    next_ele = nil
    arr.reverse_each do |e|
      list.head = Element.new(e, next_ele)
      next_ele = list.head
    end

    list
  end

  def size
    self.to_a.size
  end

  def empty?
    self.to_a.empty?
  end

  def push(n)
    from_a(self.to_a.unshift(n))
  end

  def pop
    popped, arr = self.to_a[0], self.to_a[1..-1]
    from_a(arr)
    popped
  end

  def reverse
    from_a(self.to_a.reverse)
  end

  attr_accessor :head
end