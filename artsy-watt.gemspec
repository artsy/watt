# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'artsy/watt/version'

Gem::Specification.new do |spec|
  spec.name          = "artsy-watt"
  spec.version       = Artsy::Watt::VERSION
  spec.authors       = ["Artsy - Partner Engineering"]
  spec.email         = ["dev@artsymail.com"]
  spec.description   = %q{Watt is a shared asset library for Artsy Partner Engineering rails apps}
  spec.summary       = %q{Watt is a shared asset library for Artsy Partner Engineering rails apps}
  spec.homepage      = "https://github.com/artsy/watt"
  spec.license       = "MIT"

  spec.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE.txt", "README.md"]
  spec.require_paths = ["lib", "vendor"]

  spec.add_dependency "railties", ">= 3.2"
  spec.add_dependency "sass-rails", ">= 3.2"
  spec.add_dependency "bourbon", '~> 3.2.1'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bootstrap-sass", '~> 3.0.3.0'
end
