module Persistence
  module JSONDB
    module Commandable
      def save(entity)
        entity.id = latest_index
        return false unless entity.validate

        insert_record(entity)
        true
      end

      def update(entity)
        return false unless entity.validate

        update_record(entity)
        true
      end

      def delete(entity)
        delete_record(entity)
        true
      end
    end
  end
end
