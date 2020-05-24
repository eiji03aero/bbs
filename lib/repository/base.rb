module Repository
  class Base
    include Persistence::JSONDB::Client

    def initialize
      setup_db
    end

    def save(entity)
      insert(entity)
    end

    def all
      read
    end
  end
end
