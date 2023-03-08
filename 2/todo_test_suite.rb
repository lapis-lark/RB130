require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@list.size, 3)
  end

  def test_first
    assert_equal(@list.first, @todos[0])
  end

  def test_last
    assert_equal(@list.last, @todos[-1])
  end

  def test_shift
    assert_equal(@list.shift, @todos[0]) && assert_equal(@list.size, 2)
  end

  def test_pop
    assert_equal(@list.pop, @todos[-1])
  end

  def test_done?
    @list.mark_all_done
    assert(@list.done?)
  end

  def test_only_todo_addable #TypeError
    assert_raises(TypeError) do
      @list << nil
    end
  end

  def test_add_method
    initial_size = @list.size
    @list << Todo.new("Vacuum rug")
    assert_equal((initial_size + 1), @list.size)
  end

  def test_add_alias
    initial_size = @list.size
    @list.add(Todo.new("Vacuum rug"))
    assert_equal((initial_size + 1), @list.size)
  end

  def test_item_at # should be IndexError if out of range
    setup
    index = 99
    assert_raises(IndexError) do
        @list.item_at(index)
      end
    
    index = 0
    assert_equal(@list.item_at(index), @list.first)
  end

  def test_mark_done_at # also IndexError
    index = 99
    assert_raises(IndexError) do
      @list.mark_done_at(index)
      end
    
    index = 0
    @list.mark_done_at(index)
    assert(@list.item_at(index).done?)
  end

  def test_mark_undone_at
    index = 99
    assert_raises(IndexError) do
      @list.mark_undone_at(index)
      end
    
    index = 0
    @list.mark_undone_at(index)
    refute(@list.item_at(index).done?)
  end

  def test_done!
    @list.done!
    assert(@list.all_done)
  end

  def test_remove_at #I ndex
    index = 99
    assert_raises(IndexError) do
      @list.remove_at(index)
      end
    
    index = 0
    initial_size = @list.size
    initial_todo = @list.item_at(index)
    @list.remove_at(index)
    refute_equal(@list.item_at(index), initial_todo)
    assert_equal(@list.size + 1, initial_size)
  end

  def test_to_s_undone
    setup
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_each
    comparison_string = ''
    @list.each { |_| comparison_string << 'x' } 
    assert_equal(comparison_string, 'xxx')
  end

  def test_each_returns_self
    assert_same(@list.each, @list)
  end

  def test_select_return
    assert_instance_of(TodoList, @list.select {})
  end






end