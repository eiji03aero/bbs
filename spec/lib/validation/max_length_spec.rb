RSpec.describe Validation::MaxLength do
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
          validation_value: 5
        },
      ]

      tests.each do |t|
        object = TestClass.new(t[:object_arg])
        subject = Validation::MaxLength.new(
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
          validation_value: 2
        },
      ]

      tests.each do |t|
        object = TestClass.new(t[:object_arg])
        subject = Validation::MaxLength.new(
          object: object,
          attr_name: :name,
          validation_value: t[:validation_value],
        )

        expect(subject.execute).to be_kind_of(Exception)
      end
    end
  end
end
