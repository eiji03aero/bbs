require "validation/execute.rb"
require "validation/exceptions.rb"

module Validation
  autoload :Base, "validation/base"
  autoload :Presence, "validation/presence"
  autoload :MaxLength, "validation/max_length"
end
