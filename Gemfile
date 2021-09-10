source 'https://rubygems.org'

# Declare your gem's dependencies in watt.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'rails', '5.2.6'
gem 'haml-rails'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'capybara', '2.3.0'
  gem 'shoulda-matchers', '2.6.1', require: false
  gem 'guard-rspec', require: false
  gem 'rubocop', '0.76.0'
  gem 'guard-rubocop'
end
