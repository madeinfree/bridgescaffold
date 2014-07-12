# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bridgescaffold/version'

Gem::Specification.new do |spec|
  spec.name          = "bridgescaffold"
  spec.version       = Bridgescaffold::VERSION
  spec.authors       = ["Whien"]
  spec.email         = ["sal95610@gmail.com"]
  spec.summary       = "bridgescaffold summary"
  spec.description   = "bridgescaffold description"
  spec.homepage      = "https://github.com/madeinfree/bridgescaffold.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  #spec.add_development_dependency 'rails', '~> 4.0.0'
  spec.add_development_dependency "bundler", "~> 1.6"
end
