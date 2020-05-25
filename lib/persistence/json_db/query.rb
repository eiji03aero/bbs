module Persistence
  module JSONDB
    module Query
      autoload :Base, "persistence/json_db/query/base"
      autoload :Where, "persistence/json_db/query/where"
      autoload :Limit, "persistence/json_db/query/limit"

      class << self
        def execute(args)
          name = args[:name]
          query_value = args[:query_value]
          records = args[:records]

          klass = get_query(name)
          klass.new(args)
            .execute
        end

        def get_query(name)
          case name
          when :where
            Where
          when :limit
            Limit
          else
            raise ArgumentError.new "unknown query type #{name}"
          end
        end
      end
    end
  end
end
