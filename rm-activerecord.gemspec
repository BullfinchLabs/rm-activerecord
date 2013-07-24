# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rm-activerecord/version'

Gem::Specification.new do |gem|
  gem.name          = "rm-activerecord"
  gem.version       = RMActiveRecord::VERSION
  gem.authors       = ["Bullfinch Software"]
  gem.email         = ["mail@bullfin.ch"]
  gem.description   = %q{SQLite ORM for RubyMotion, inspired from ActiveRecord}
  gem.summary       = %q{SQLite ORM for RubyMotion}
  gem.homepage      = "https://github.com/BullfinchSoftware/rm-activerecord"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
