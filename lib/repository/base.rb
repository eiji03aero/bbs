module Repository
  class Base
    include Persistence::JSONDB::Client
    include Persistence::JSONDB::Commandable
    include Persistence::JSONDB::Queryable

    def initialize
      setup_db
    end
  end
end
