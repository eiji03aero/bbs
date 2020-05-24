require "json"

module Persistence
  module JSONDB
    DATA_DIR = File.expand_path('../../../data', __dir__)

    module Client
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

      def insert(data)
        data.id = latest_index
        records = read
        records.push(data)
        write(records)
      end

      private
        def file_path
          File.join(DATA_DIR, table_name+".json")
        end

        def latest_index
          ids = read
            .map { |r| r.id }
          return 1 if ids.length <= 0

          ids.max + 1
        end

        def table_name
          self.class.get_table_name
        end
    end
  end
end
