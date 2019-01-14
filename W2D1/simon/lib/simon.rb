class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless self.game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts
    puts
    puts self.seq
    sleep(3)
    system("clear")
  end

  def require_sequence
    puts "Repeat the sequence one color at a time:"
    self.seq.each do |color|
      input = gets.chomp.downcase
      self.game_over = true unless input == color
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts
    puts "Congratulations, you passed the round."
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end


if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end