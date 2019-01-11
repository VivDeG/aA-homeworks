class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def set(key, value)
    idx = find_key(key)
    unless idx == nil
      self.map[idx][1] = value
    else
      self.map << [key, value]
    end
    self.map
  end

  def get(key)
    self.map.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def delete(key)
    idx = find_key(key)
    self.map.delete_at(idx) unless idx == nil
  end

  def show
    self.map
  end

  private

  def find_key(key)
    self.map.each_with_index do |pair, i|
      return i if pair.first == key
    end
    nil
  end
end