class Post < Entity::Base
  validates :id, presence: true
  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :content, presence: true, max_length: 250

  attr_accessor :id, :user_id, :board_id, :content

  def initialize(args)
    @id = args[:id]
    @user_id = args[:user_id]
    @board_id = args[:board_id]
    @content = args[:content]
  end

  def serialize
    {
      id: id,
      user_id: user_id,
      board_id: board_id,
      content: content,
    }
  end
end
