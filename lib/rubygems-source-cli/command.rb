module Rubygems::Source::CLI
  module CommandPatch
    def initialize(*args)
      warning = "* This command is patched by rubygems-source-cli v#{Rubygems::Source::CLI::VERSION} *"
      say "\n" + (%w(*) * warning.length).join
      say warning
      say (%w(*) * warning.length).join + "\n\n"
      super
    end
  end
end
