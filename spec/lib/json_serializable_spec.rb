RSpec.describe JSONSerializable do
  class SerializeClass
    include JSONSerializable

    attr_accessor :name

    def initialize(arg)
      @name = arg[:name]
    end

    def serialize
      {
        name: name
      }
    end
  end

  let(:name) { "hoge" }
  let(:str) { "{\"json_class\":\"SerializeClass\",\"name\":\"hoge\"}" }
  subject { SerializeClass.new(name: name) }

  it "serializes object to JSON string" do
    expect(subject.to_json).to eq str
  end

  it "creates object from string" do
    obj = JSON.load(str)
    expect(obj.name).to eq name
  end
end
