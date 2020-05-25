require "faker"

require_relative "../app/main"

App::UserRepository.reset
App::PostRepository.reset
App::BoardRepository.reset

num_users = 20
num_boards = 20
num_posts = 200

num_users.times do |i|
  user = User.new(
    name: Faker::Name.name
  )
  App::UserRepository.save(user)
end

num_boards.times do |i|
  board = Board.new(
    name: Faker::Music::RockBand.name
  )
  App::BoardRepository.save(board)
end

num_posts.times do |i|
  post = Post.new(
    user_id: rand(num_users),
    board_id: rand(num_boards),
    content: Faker::Quote.famous_last_words,
  )
  App::PostRepository.save(post)
end
