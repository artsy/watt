# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watt/version'

Gem::Specification.new do |spec|
  spec.name          = "watt"
  spec.version       = Watt::VERSION
  spec.authors       = ["Artsy - Partner Engineering"]
  spec.email         = ["it@artsymail.com"]
  spec.description   = %q{Watt is a shared asset library for Artsy Partner Engineering rails apps.}
  spec.summary       = %q{Watt is a shared asset library for Artsy Partner Engineering rails apps.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.require_paths = ["lib"]
  spec.files = Dir["{lib,app}/**/*"] + ["LICENSE.txt", "README.md"]
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "railties", "~> 3.1"
  spec.add_development_dependency "rake"
end
