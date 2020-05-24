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
    self.class.validator.execute
  end

  def errors
    @errors ||= []
  end
end
