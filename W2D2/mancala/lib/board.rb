class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @players = [name1, name2]
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_index do |i|
      self.cups[i] = [:stone, :stone, :stone, :stone] unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 0
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    end_pos = start_pos
    other_store = current_player_name == players.first ? 13 : 6
    
    until self.cups[start_pos].empty?
      end_pos = (end_pos + 1) % 14
      self.cups[end_pos] << self.cups[start_pos].pop unless end_pos == other_store
    end
    render
    next_turn(end_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return ending_cup_idx if self.cups[ending_cup_idx].length > 1
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    :switch
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if self.cups[0..5].all? { |cup| cup.empty? }
    return true if self.cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    p1_store = self.cups[6].length
    p2_store = self.cups[13].length
    return :draw if p1_store == p2_store
    return p1_store > p2_store ? players.first : players.last
  end

  private

  attr_reader :players
end
