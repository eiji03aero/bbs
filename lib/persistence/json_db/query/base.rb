module Persistence
  module JSONDB
    module Query
      class Base
        attr_accessor :records, :query_value

        def initialize(args)
          @records = args[:records]
          @query_value = args[:query_value]
        end

        def execute
          raise NotImplementedError.new "#execute not implemented"
        end
      end
    end
  end
end
