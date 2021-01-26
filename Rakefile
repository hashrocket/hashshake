require 'dotenv/tasks'

task default: %w[test]

task test: :dotenv do
  ruby '-Itest test/**/*'
end

task notify: :dotenv do
  ruby 'workers/notify_shakers.rb'
end
