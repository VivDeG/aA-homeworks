class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue << el
  end

  def dequeue
    self.queue.shift
  end

  def peek
    self.queue.first
  end
end