module Persistence
  autoload :JSONDB, "persistence/json_db"

  class RecordNotFound < StandardError; end
end
