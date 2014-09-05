$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "watt/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "watt"
  s.version = Watt::VERSION
  s.authors = ['Artsy - Partner Engineering']
  s.email = ['dev@artsymail.com']
  s.description = 'Watt is a shared asset library for Artsy PE rails apps'
  s.summary = 'Watt is a shared asset library for Artsy PE rails apps'
  s.homepage = 'https://github.com/artsy/watt'
  s.license = 'MIT'
  s.files = Dir['{lib,vendor}/**/*'] + ['README.md']
  s.require_paths = %w(lib vendor)
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
end
