module Rubygems
  module Source
    module CLI
      autoload :Version, "rubygems-source-cli/version"
      COMMANDS = %w(yank push server)
    end
  end
end

require File.expand_path(File.join(File.dirname(__FILE__), "..", "test", "test_helper")) if ENV['RUBY_ENV'] == 'test'
