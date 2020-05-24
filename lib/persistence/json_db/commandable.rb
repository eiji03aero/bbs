module Persistence
  module JSONDB
    module Commandable
      def save(entity)
        insert(entity)
      end
    end
  end
end
