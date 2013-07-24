require "rm-activerecord/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  %w(
    rake_tasks
  ).each do |x|
    app.files.unshift(File.join(File.dirname(__FILE__), "rm_activerecord/#{x}.rb"))
  end
end
