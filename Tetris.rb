class MyPiece < Piece

  def initialize (point_array, board)
    super(point_array, board)
  end 

  New_Pieces = [rotations([[0, 0], [1, 0], [0, 1], [1, 1], [0, 2]]),   #first new piece
                rotations([[0, 0], [-1, 0], [1, 0], [2, 0], [-2, 0]]), #second new piece
                rotations([[0, 0], [1, 0], [0, 1]])]                   #third new piece

  All_My_Pieces = All_Pieces.concat(New_Pieces)
  Cheat_piece = [[[0, 0]]]

  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end

  def self.next_piece_cheated(board)
    MyPiece.new(Cheat_piece, board)
  end
end

class MyBoard < Board
  
  def initialize (game)
    @grid = Array.new(num_rows) {Array.new(num_columns)}
    @current_block = MyPiece.next_piece(self)
    @score = 0
    @game = game
    @delay = 500
    @cheating = false
  end

  def cheating
    if @score >= 100 && @cheating == false
      @score -= 100
      @cheating = true
    end
  end

  def next_piece
  if @cheating
    @current_block = MyPiece.next_piece_cheated(self)
    @cheating = false
  else
    @current_block = MyPiece.next_piece(self)
  end
    @current_pos = nil
  end

  def rotate_180
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..(locations.size-1)).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
end

class MyTetris < Tetris
  def initialize
    super
  end

  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_180})
    @root.bind('c', proc {@board.cheating})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end
end


