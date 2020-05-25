module Validation
  class Presence < Base
    def execute
      presence = !!attr_value
      is_valid = validation_value ? presence : !presence
      return nil if is_valid

      msg = validation_value ? "presence required" : "presence not required"
      create_error(msg)
    end
  end
end
