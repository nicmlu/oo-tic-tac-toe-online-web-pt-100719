class TicTacToe
  attr_reader :board, :input, :token, :position, :valid_move

  def initialize
    @board = Array.new(9, " ")
  end 

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(str)
    @input = str.to_i
    @input = @input - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if @board[index] == " " 
      false
    else
      true
    end 
  end 
  
  def valid_move?(position)
    if @board[position] == " " && position.between?(0,8)
      true
    else
      false
    end 
  end 
  
  def turn
    input = gets.chomp
    @position = input_to_index(input)
    @valid_move = valid_move?(position)
    @token = current_player
    
    if valid_move
      move(@position, @token)
    else 
      puts "invalid"
      turn
    end 
    display_board
  end   
  
  
  def turn_count
    occupied_positions = []
    
    @board.each do |position|
      if position != " "
        occupied_positions.push(position)
      end 
    end
      occupied_positions.count
  end 
  
  def current_player 
  self.turn_count % 2 == 0 ? "X" : "O"
  end 
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo) == true 
        true
      # elsif position_taken?(combo) == true 
      else
        false
      end 
      combo
    end
  end
  
  def full?
    if turn_count == 9
      true
    else
      false
    end
  end 
  
  def draw?
    if turn_count == 9 && won? == false
      true  
    elsif won? == true
      false
    else  turn_count < 9 && won? == false 
      false
    end 
  end 
  
  def over?
    if won? == true || draw? == true 
      true
    else       
      false
    end 
  end 
  
  def winner
  end 
  
end 