require '/home/viktor/repos/Chess/lib/rooks.rb'
require '/home/viktor/repos/Chess/lib/knights.rb'
require '/home/viktor/repos/Chess/lib/bishop.rb'
require '/home/viktor/repos/Chess/lib/kings.rb'
require '/home/viktor/repos/Chess/lib/queen.rb'
require '/home/viktor/repos/Chess/lib/pawn.rb'

class Board
  attr_accessor :board
  def initialize (player_1 = nil, player_2 = nil)
    @player_1 = 'white'
    @player_2 = 'black'
    @board = []
  end

  def formBoard
    # puts "Board formed"
    @board = Array.new(8){Array.new(8)}
    p @board
    for i in 0..7
      white_pawn = Pawn.new(@player_1)
      @board[6][i] = 'wp'
      black_pawn = Pawn.new(@player_2)
      @board[1][i] = 'bp'
    end
    white_rooks = Rooks.new(@player_1)
    @board[7][0]='wr'
    @board[7][7]= 'wr'
    black_rooks = Rooks.new(@player_2)
    @board[0][0] = 'br'
    @board[0][7] = 'br'
    

    p @board
  end
end

newb = Board.new()
newb.formBoard