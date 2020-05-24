module Persistence
  module JSONDB
    module Queryable
      def query
        QueryBuilder.new(self)
      end

      def find(id)
        records = query
          .where(id: id)
          .execute
        raise RecordNotFound.new if records.empty?

        records.first
      end

      def find_by(opts)
        query
          .where(opts)
          .execute
          .first
      end

      def all
        read
      end
    end
  end
end
