require "json"

module Persistence
  module JSONDB
    module Client
      TABLE_DIR = File.expand_path('../../../data/tables', __dir__)

      def self.included(o)
        o.extend(ClassMethods)
      end

      module ClassMethods
        def table_name(name)
          @table_name = name.to_s
        end

        def get_table_name
          raise StandardError.new "table name not given" unless defined? @table_name
          @table_name
        end
      end

      def setup_db
        reset unless File.exist?(file_path)
      end

      def read
        File.open(file_path, "r") do |f|
          JSON.load(f)
        end
      end

      def write(records)
        File.open(file_path, "w") do |f|
          JSON.dump(records, f)
        end
      end

      def reset
        write([])
      end

      def insert_record(entity)
        records = read
          .push(entity)
        write(records)
      end

      def update_record(entity)
        records = read
          .map { |r| r.id == entity.id ? entity : r }
        write(records)
      end

      def delete_record(entity)
        records = read
          .filter { |r| r.id != entity.id }
        write(records)
      end

      private
        def file_path
          File.join(TABLE_DIR, table_name+".json")
        end

        def latest_index
          ids = read
            .map(&:id)
          return 1 if ids.length <= 0

          ids.max + 1
        end

        def table_name
          self.class.get_table_name
        end
    end
  end
end
