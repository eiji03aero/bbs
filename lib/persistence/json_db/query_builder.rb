module Persistence
  module JSONDB
    class QueryBuilder
      attr_accessor :client, :queries

      def initialize(client)
        @client = client
        @queries = []
      end

      def execute
        records = @client.read
        queries.reduce(records) do |result, item|
          name, value = item
          Query::execute(
            name: name,
            query_value: value,
            records: result
          )
        end
      end

      # -------------------- query methods --------------------
      def where(value)
        queries.push([:where, value])
        self
      end

      def limit(value)
        queries.push([:limit, value])
        self
      end
    end
  end
end
