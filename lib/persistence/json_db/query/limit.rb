module Persistence
  module JSONDB
    module Query
      # Examples:
      # - hoge_repo.limit(1)
      class Limit < Base
        def execute
          records.first(query_value)
        end
      end
    end
  end
end
