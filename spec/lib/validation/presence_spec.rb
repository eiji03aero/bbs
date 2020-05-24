RSpec.describe Validation::Presence do
  class TestClass
    attr_accessor :name

    def initialize(arg)
      @name = arg[:name]
    end
  end

  describe "#execute" do
    it "returns nil with valid object" do
      tests = [
        {
          object_arg: {
            name: "hoge"
          },
          validation_value: true
        },
        {
          object_arg: {
            name: nil
          },
          validation_value: false
        }
      ]

      tests.each do |t|
        object = TestClass.new(t[:object_arg])
        subject = Validation::Presence.new(
          object: object,
          attr_name: :name,
          validation_value: t[:validation_value],
        )

        expect(subject.execute).to be_nil
      end
    end

    it "returns error with invalid object" do
      tests = [
        {
          object_arg: {
            name: "hoge"
          },
          validation_value: false
        },
        {
          object_arg: {
            name: nil
          },
          validation_value: true
        }
      ]

      tests.each do |t|
        object = TestClass.new(t[:object_arg])
        subject = Validation::Presence.new(
          object: object,
          attr_name: :name,
          validation_value: t[:validation_value],
        )

        expect(subject.execute).to be_instance_of(StandardError)
      end
    end
  end
end
