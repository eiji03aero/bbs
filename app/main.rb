require_relative "../lib/main"

Dir.glob(File.expand_path("./**/*.rb", __dir__)).each do |f|
  require_relative f
end
