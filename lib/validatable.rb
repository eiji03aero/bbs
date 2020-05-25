module Validatable
  def self.included(o)
    o.extend(ClassMethods)
  end

  module ClassMethods
    def validator
      @validator ||= Validator.new
    end

    def validates(name, opts)
      validator.add(name, opts)
    end
  end

  def validate
    @errors = []

    result = self.class.validator.execute(self)
    errors.concat(result)
    errors.empty?
  end

  def errors
    @errors ||= []
  end
end
