class UserRepository
  attr_accessor :db

  def initialize
    @db = JSONDB.new(name: "users")
  end

  def save(user)
    @db.insert(user)
  end

  def all
    @db.read
  end
end
