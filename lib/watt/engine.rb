module Watt
  class Engine < ::Rails::Engine
    isolate_namespace Watt
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
