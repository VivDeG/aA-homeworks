class LRUCache
  def initialize(size)
    @cache = Array.new(size)
  end

  def count
    num = 0
    cache.each { |el| num += 1 unless el.nil? }
    num
  end

  def add(el)
    cache.include?(el) ?  cache.delete(el) : cache.shift
    cache << el
    cache.dup
  end

  def show
    p cache.dup
  end

  private
  attr_reader :cache

end


if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end