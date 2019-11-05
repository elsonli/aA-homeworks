class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1_name = name1
    @player_2_name = name2
    
    # Instantiate the cups and fills non-store cups with four stones each
    @cups = Array.new(14) { Array.new }
    self.place_stones
  end

  def place_stones
    (0..5).each do |idx|
      4.times { @cups[idx] << :stone }
    end
    (7..12).each do |idx|
      4.times { @cups[idx] << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos >= 14
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

    # Keep track of the number of stones and then empties the cup
    num_stones = self.cups[start_pos].length
    self.cups[start_pos].clear
    counter = 1

    # Place the stones into the cups while there are still stones
    while counter <= num_stones
      new_cup_pos = (start_pos + counter) % 13
      if (new_cup_pos == 6) && (current_player_name == @player_1_name)
        self.cups[new_cup_pos] << :stone
      elsif (new_cup_pos == 13) && (current_player_name == @player_2_name)
        self.cups[new_cup_pos] << :stone
      else
        self.cups[new_cup_pos] << :stone
      end
      counter += 1
    end

    # Render the board on each turn
    self.render

    # Takes care of the logic for the next turn
    ending_cup_idx = (start_pos + num_stones) % 14
    self.next_turn(current_player_name, ending_cup_idx)
  end

  def next_turn(current_player_name, ending_cup_idx)
    # Helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if (ending_cup_idx == 6) && (current_player_name == @player_1_name)
      :prompt
    elsif (ending_cup_idx == 13) && (current_player_name == @player_2_name)
      :prompt
    elsif self.cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player_1_empty = self.cups[0..5].all? { |cup| cup.empty? }
    player_2_empty = self.cups[7..12].all? { |cup| cup.empty? }
    player_1_empty || player_2_empty
  end

  def winner
    if self.cups[6] == self.cups[13]
      return :draw
    else
      self.cups[6].length > self.cups[13].length ? @player_1_name : @player_2_name
    end
  end
end
