class UserRepository < Repository::Base
  table_name :users

  def posts_for(user)
    PostRepository.new
      .query
      .where(user_id: user.id)
      .execute
  end

  def boards_for(user)
    board_ids = PostRepository.new
      .query
      .where(user_id: user.id)
      .execute
      .map(&:board_id)
      .uniq

    BoardRepository.new
      .query
      .where(id: board_ids)
      .execute
  end
end
