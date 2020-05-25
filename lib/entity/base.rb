module Entity
  class Base
    include JSONSerializable
    include Validatable

    def set_attributes(attrs)
      attrs.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
end
