module Service::User
  class << self
    def create(args)
      user = User.new(args)
      unless UserRepository.new.save(user) 
        user.errors
      end

      user
    end

    def update(args)
      user = UserRepository.new.find(args[:id])
      user.set_attributes(args)
      unless UserRepository.new.update(user)
        user.errors
      end

      user
    end

    def delete(args)
      user = UserRepository.new.find(args[:id])
      UserRepository.new.delete(user)
    end
  end
end
