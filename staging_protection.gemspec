# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'staging_protection/version'

Gem::Specification.new do |spec|
  spec.name          = "staging_protection"
  spec.version       = StagingProtection::VERSION
  spec.authors       = ["Anna Kazakova (gaar4ica)"]
  spec.email         = ["gaar4ica@gmail.com"]
  spec.description   = "A simple gem to protect an application from search engine cache"
  spec.summary       = "Use password authentication for html-like requests"
  spec.homepage      = "https://github.com/gaar4ica/staging_protection.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", "~> 3.2"
end
