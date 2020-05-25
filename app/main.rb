lib_path = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_path)

require_relative "../lib/main"

Dir.glob(File.expand_path("./**/*.rb", __dir__)).each do |f|
  require_relative f
end
