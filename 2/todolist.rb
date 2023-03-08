class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    for todo in self.todos
      yield(todo) if block_given?
    end

    self
  end

  def select
    selected = TodoList.new(self.title)
    for todo in self.todos
      selected << todo if yield(todo)
    end

    selected
  end

  def find_by_title(title)
    selected = self.select { |todo| todo.title == title }
    selected.first
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| !todo.done? }
  end

  def mark_done(title)
    self.each do |todo|
      if todo.title == title
        todo.done!
        return self
      end
    end
  end

  def mark_all_done
    self.each { |todo| todo.done! }
  end

  def mark_all_undone
    self.each { |todo| todo.undone! }
  end

  def add(todo)
    raise TypeError.new("Can only add Todo ojects") if todo.class != Todo
    todos << todo
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(n)
    todos.fetch(n)
  end

  def mark_done_at(n)
    todos.fetch(n).done!
  end

  def mark_undone_at(n)
    todos.fetch(n).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(n)
    todos.fetch(n) # to return IndexError instead of nil when out of range
    todos.delete_at(n)
  end

  def to_s
    "---- #{title} ----\n" + todos.join("\n")
  end

  def ==(other_list)
    self.title == other_list.title &&
    self.todos == other_list.todos
  end
end
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Clean room")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

todo1.done!

puts list.find_by_title("Clean room")