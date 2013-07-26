require "rm-activerecord/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  %w(
    rm-utils
  ).each do |x|
    app.files.unshift(File.join(File.dirname(__FILE__), "rm-activerecord/#{x}.rb"))
  end

  load File.join(File.dirname(__FILE__), "rm-activerecord/rma.rake")
end
