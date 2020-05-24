RSpec.describe Post do
  let(:id) { 1 }
  let(:user_id) { 1 }
  let(:board_id) { 1 }
  let(:content) { "hogehoge" }

  subject {
    Post.new(
      id: id,
      user_id: user_id,
      board_id: board_id,
      content: content,
    )
  }

  it "serializes" do
    s = subject.serialize
    expect(s).to include(
      id: id,
      user_id: user_id,
      board_id: board_id,
      content: content,
    )
  end
end
