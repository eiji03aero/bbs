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
    result = self.class.validator.execute(self)
    errors.concat(result)
    result.empty?
  end

  def errors
    @errors ||= []
  end
end
