require "json"

module Persistence
  module JSONDB
    autoload :Client, "persistence/json_db/client"
    autoload :Commandable, "persistence/json_db/commandable"
    autoload :Query, "persistence/json_db/query"
    autoload :QueryBuilder, "persistence/json_db/query_builder"
    autoload :Queryable, "persistence/json_db/queryable"
  end
end
