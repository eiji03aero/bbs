require "json"

module JSONSerializable
  def self.included(o)
    o.extend(ClassMethods)
  end

  module ClassMethods
    def json_create(obj)
      object = obj
        .filter { |k,v| k != JSON.create_id }
        # Since JSON.load's create_additions and symbolize_names cannot be used
        # together, need to manually symbolize keys for easy access
        .transform_keys(&:to_sym)
      new(object)
    end
  end

  def serialize
    {}
  end

  def to_json(*a)
    { JSON.create_id => self.class.name }
      .merge(serialize)
      .to_json(*a)
  end
end
