module Validation
  class MaxLength < Base
    def execute
      is_valid = attr_value.length <= validation_value
      return nil if is_valid

      create_error "max length exceeded max=#{validation_value} actual=#{attr_value.length}"
    end
  end
end
