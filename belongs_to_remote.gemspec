# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'belongs_to_remote/version'

Gem::Specification.new do |spec|
  spec.name          = "belongs_to_remote"
  spec.version       = BelongsToRemote::VERSION
  spec.authors       = ["Alex Avoyants"]
  spec.email         = ["shhavel@gmail.com"]
  spec.summary       = %q{ActiveRecord belongs to ActiveResource association (e.g. belongs_to_remote :user).}
  spec.description   = %q{ActiveRecord belongs to ActiveResource association (e.g. belongs_to_remote :user). Supports options :class_name, :foreign_key, :polymorphic}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", '~> 3.2'
  spec.add_dependency "activerecord", '~> 3.2'
  spec.add_dependency "activeresource", '~> 3.2'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
