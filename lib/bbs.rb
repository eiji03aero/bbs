load_paths = []
load_paths.concat(Dir.glob(File.expand_path("./utils/**/*.rb", __dir__)))
load_paths.concat(Dir.glob(File.expand_path("./bbs/**/*.rb", __dir__)))
load_paths.each do |f|
  require_relative f
end

module Bbs
  class Error < StandardError; end
end
