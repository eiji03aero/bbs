module Validatable
  def self.included(o)
    o.extend(ClassMethods)
  end

  module ClassMethods
    def validates(name, opts)
      validations.push([name, opts])
    end

    def validations
      @@validations ||= []
    end
  end

  def validate
  end

  def errors
    @errors ||= []
  end
end
