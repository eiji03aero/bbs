RSpec.describe Validatable do
  class TestClass
    include Validatable

    validates :name, presence: true

    attr_accessor :name

    def initialize(args)
      @name = args[:name]
    end
  end

  describe ".validate" do
    context "with valid object" do
      subject { TestClass.new(name: "hoge") }

      it "does not add error" do
        result = subject.validate
        expect(result).to be true
        expect(subject.errors.length).to eq 0
      end
    end

    context "with invalid object" do
      subject { TestClass.new(name: nil) }

      it "does add error" do
        result = subject.validate
        expect(result).to be false
        expect(subject.errors.length).to eq 1
      end
    end
  end
end
