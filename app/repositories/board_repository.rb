class BoardRepository < Repository::Base
  table_name :boards

  def users_for(board)
    user_ids = PostRepository.new
      .query
      .where(board_id: board.id)
      .execute
      .map(&:user_id)
      .uniq

    UserRepository.new
      .query
      .where(id: user_ids)
      .execute
  end

  def posts_for(board)
    PostRepository.new
      .query
      .where(board_id: board.id)
      .execute
  end
end
