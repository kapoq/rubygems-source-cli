module Rubygems
  module Source
    module CLI
      autoload :Version, "rubygems-source-cli/version"
      COMMANDS = %w(yank push server)
    end
  end
end
