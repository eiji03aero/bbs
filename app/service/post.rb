module Service::Post
  class << self
    def create(args)
      post = Post.new(args)
      unless PostRepository.new.save(post) 
        post.errors
      end

      post
    end

    def update(args)
      post = PostRepository.new.find(args[:id])
      post.set_attributes(args)
      unless PostRepository.new.update(post)
        post.errors
      end

      post
    end

    def delete(args)
      post = PostRepository.new.find(args[:id])
      PostRepository.new.delete(post)
    end
  end
end
