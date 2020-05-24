module Persistence::JSONDB
  RSpec.describe QueryBuilder do
    describe "#execute" do
      it "executes queries" do
        records = []
        client = double("client")
        allow(client).to receive(:read) { records }
        subject = QueryBuilder.new(client)

        allow(Query).to receive(:execute).with(
          name: :where,
          query_value: { id: 1 },
          records: records,
        )

        subject.where(id: 1)
        subject.execute
      end
    end
  end
end
