module Persistence
  module JSONDB
    module Query
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
