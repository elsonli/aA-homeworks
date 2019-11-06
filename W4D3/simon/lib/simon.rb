class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    self.take_turn until self.game_over
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless self.game_over
      self.round_success_message 
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    system("clear")
    puts "You will have 5 seconds to look at the following sequence."
    puts self.seq.dup
    sleep(5)
    system("clear")
  end

  def require_sequence
    counter = 0
    while counter < self.sequence_length
      puts "One color at a time, the next color is..."
      player_guess = gets.chomp
      unless player_guess == self.seq[counter]
        self.game_over = true
        break
      end
      counter += 1
    end
    puts "----------------------------------------"
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You have survived one more turn..."
  end

  def game_over_message
    puts "You can't get a higher score than #{self.sequence_length - 1}. Bet."
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
