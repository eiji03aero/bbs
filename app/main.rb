require_relative "../lib/main"

Dir.glob(File.expand_path("./**/*.rb", __dir__)).each do |f|
  require_relative f
end

$user = User.new(name: "eiji")
$post = Post.new(user_id: 1, board_id: 1, content: "hoge")
$board = Board.new(name: "nerds")

module App
  UserRepository = UserRepository.new
  BoardRepository = BoardRepository.new
  PostRepository = PostRepository.new
end
