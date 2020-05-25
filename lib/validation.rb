module Validation
  autoload :Base, "validation/base"
  autoload :Presence, "validation/presence"
  autoload :MaxLength, "validation/max_length"

  class ValidationFailed < StandardError; end

  class << self
    def execute(arg)
      object = arg[:object]
      attr_name = arg[:attr_name]
      name = arg[:validation_name]
      value = arg[:validation_value]

      klass = get_validation(name)
      klass.new(arg)
        .execute
    end

    def get_validation(name)
      case name
      when :presence
        Presence
      when :max_length
        MaxLength
      else
        raise ArgumentError.new "unknown validation type #{name}"
      end
    end
  end
end
