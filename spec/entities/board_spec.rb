RSpec.describe Board do
  let(:id) { 1 }
  let(:name) { "nerds" }

  subject { Board.new(id: id, name: name) }

  it "serializes" do
    s = subject.serialize
    expect(s).to include(
      id: id,
      name: name,
    )
  end
end
