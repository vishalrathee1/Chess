require '/home/viktor/repos/Chess/lib/board.rb'

class Players
  attr_accessor :player_name
  def initialize(player_name)
    @player_name = player_name
  end
end


class Chess

  @@game_status = 'playing'

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play_chess(player_1 = @player_1.player_name, player_2 = @player_2.player_name)
    @game_board = Board.new(player_1, player_2)
    @game_board.formBoard
    p @game_board.board
    while @@game_status == 'playing'
      make_move(player_1)
      check_game_status(@game_board)
      make_move(player_2)
      check_game_status(@game_board)
    end
    make_move(player_1)
    declare_winner
  end

  def declare_winner
    if player_1 == 'winner'
      puts "#{player_1} wins!"
    elsif player_2 == 'winner'
      puts "#{player_2} wins! "
    else
      puts "game is drawn"
    end
  end

  def make_move(player)
    puts "Type your move"
    move = gets.chomp
    p move

    check_legal_move(move, player)
  end

  def check_legal_move(move, player)
    if move.length > 6
      puts "Invalid move"
    else
      which_piece(move)
    end
  end

  def which_piece(move)


    if move[0]=='R'
      puts "Move Rook"
    elsif move[0] =='N'
      puts "Move Knight"
    elsif move[0] == 'B'
      puts "Move Bishop"
    elsif move[0] == 'Q'
      puts "Move Queen"
    elsif move[0] == 'K'
      puts "Move king"
    elsif ['a','b','c','d','e','f','g','h'].include?(move[0])
      puts "Pawn Move"
    else
      puts "Invalid Move"
    end
  end

  def check_game_status(board = @game_board)
    
  end
end

human = Players.new('Human')
comp = Players.new('comp')
new_game = Chess.new(human, comp)
new_game.make_move(human)