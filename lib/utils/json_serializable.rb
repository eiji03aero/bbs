require "json"

module JSONSerializable
  def self.included(o)
    o.extend(ClassMethods)
  end

  module ClassMethods
    def json_create(obj)
      object = obj
        .to_a
        .map { |arr| [arr[0].to_sym, arr[1]] }
        .to_h
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
