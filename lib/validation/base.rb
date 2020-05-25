module Validation
  class Base
    attr_accessor :object, :attr_name,
      :validation_value

    def initialize(arg)
      @object = arg[:object]
      @attr_name = arg[:attr_name]
      @validation_value = arg[:validation_value]
    end

    def execute
      raise NotImplementedError.new "#execute method unimplemented"
    end

    protected
      def attr_value
        object.send(attr_name)
      end

      def create_error(msg)
        ValidationFailed.new <<~EOF
          Validation error: #{object.class.name} attr_name=#{attr_name} validation_value=#{validation_value}
          error: #{msg}
        EOF
      end
  end
end
