class User
  include JSONSerializable

  attr_accessor :id, :name

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
  end

  def serialize
    {
      id: id,
      name: name,
    }
  end
end
