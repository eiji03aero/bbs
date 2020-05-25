module Service::Board
  class << self
    def create(args)
      board = Board.new(args)
      unless BoardRepository.new.save(board) 
        board.errors
      end

      board
    end

    def update(args)
      board = BoardRepository.new.find(args[:id])
      board.set_attributes(args)
      unless BoardRepository.new.update(board)
        board.errors
      end

      board
    end

    def delete(args)
      board = BoardRepository.new.find(args[:id])
      BoardRepository.new.delete(board)
    end
  end
end
