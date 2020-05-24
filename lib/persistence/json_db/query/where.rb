module Persistence
  module JSONDB
    module Query
      # Examples:
      # - hoge_repo.where(name: "hoge")
      # - hoge_repo.where(name: ["kore", "sore"])
      class Where < Base
        def execute
          query_value
            .to_a
            .reduce(records) do |result, item|
              key, value = item
              case value
              when String, Numeric
                result.filter { |r| r.send(key) == value }
              when Array
                result.filter { |r| value.include? r.send(key) }
              else
                raise ArgumentError.new "unknown value type for where: #{value}"
              end
            end
        end
      end
    end
  end
end
