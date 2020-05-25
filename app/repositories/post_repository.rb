class PostRepository < Repository::Base
  table_name :posts

  def user_for(post)
    UserRepository.new
      .find_by(id: post.user_id)
  end

  def board_for(post)
    BoardRepository.new
      .find_by(id: post.board_id)
  end
end
