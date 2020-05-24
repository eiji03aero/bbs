require "persistence/json_db/query/execute"

module Persistence
  module JSONDB
    module Query
      autoload :Base, "persistence/json_db/query/base"
      autoload :Where, "persistence/json_db/query/where"
      autoload :Limit, "persistence/json_db/query/limit"
    end
  end
end
