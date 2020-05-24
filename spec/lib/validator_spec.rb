RSpec.describe Validator do
  describe "#add" do
    subject { Validator.new }

    it "adds rule" do
      subject.add(:name, {})

      expect(subject.validations.length).to eq 1
    end
  end

  describe "#execute" do
    class TestClass
      attr_accessor :name

      def initialize(args)
        @name = args[:name]
      end
    end

    let (:object) { TestClass.new(name: "hoge") }
    subject { Validator.new }

    it "returns empty array with valid object" do
      subject.add(:name, presence: true)
      result = subject.execute(object)

      expect(result.length).to eq 0
    end

    it "returns empty array with valid object" do
      subject.add(:name, presence: false)
      result = subject.execute(object)

      expect(result.length).to eq 1
      expect(result.first).to be_instance_of(StandardError)
    end
  end
end
