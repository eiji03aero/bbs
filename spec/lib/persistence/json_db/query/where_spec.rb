module Persistence::JSONDB::Query
  RSpec.describe Where do
    class TestClass
      attr_accessor :id, :name

      def initialize(args)
        @id = args[:id]
        @name = args[:name]
      end
    end

    describe "#execute" do
      let (:records) {
        [
          TestClass.new(id: 1, name: "one"),
          TestClass.new(id: 2, name: "two"),
          TestClass.new(id: 3, name: "three"),
        ]
      }

      it "filters by primitive" do
        subject = Where.new(records: records, query_value: { id: 1 })

        result = subject.execute
        expect(result.length).to eq 1
        expect(result.first.id).to eq 1
      end

      it "filters by array" do
        subject = Where.new(records: records, query_value: { id: [1, 2] })

        result = subject.execute
        expect(result.length).to eq 2
      end

      it "filters by multiple value" do
        subject = Where.new(records: records, query_value: { id: 1, name: "one" })

        result = subject.execute
        expect(result.length).to eq 1
      end
    end
  end
end
