module Rubygems
  module Source
    module CLI
      autoload :VERSION, "rubygems-source-cli/version"
      autoload :CommandPatch, "rubygems-source-cli/command_patch"
      
      COMMANDS = %w(yank push server)
    end
  end
end

require File.expand_path(File.join(File.dirname(__FILE__), "..", "test", "test_helper")) if ENV['RUBY_ENV'] == 'test'
