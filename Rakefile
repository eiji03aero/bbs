require "rake"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end

task :default => :spec

task :guard do
  system("bundle exec guard")
end

task :seed do
  require_relative "./data/seed.rb"
end
