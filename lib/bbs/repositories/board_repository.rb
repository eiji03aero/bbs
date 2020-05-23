class BoardRepository
  attr_accessor :db

  def initialize
    @db = JSONDB.new(name: "boards")
  end

  def save(board)
    @db.insert(board)
  end

  def all
    @db.read
  end
end
