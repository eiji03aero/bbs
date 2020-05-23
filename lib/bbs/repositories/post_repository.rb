class PostRepository
  attr_accessor :db

  def initialize
    @db = JSONDB.new(name: "posts")
  end

  def save(post)
    @db.insert(post)
  end

  def all
    @db.read
  end
end
