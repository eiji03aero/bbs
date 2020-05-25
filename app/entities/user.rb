class User < Entity::Base
  validates :id, presence: true
  validates :name, presence: true

  attr_accessor :id, :name

  def initialize(attrs)
    set_attributes(attrs)
  end

  def serialize
    {
      id: id,
      name: name,
    }
  end
end
