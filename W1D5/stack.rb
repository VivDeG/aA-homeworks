class Stack
  attr_accessor :stack
  
  def initialize
    @stack = []
  end

  def push(el)
    self.stack << el
  end

  def pop
    self.stack.pop
  end

  def peek
    self.stack.last
  end
end