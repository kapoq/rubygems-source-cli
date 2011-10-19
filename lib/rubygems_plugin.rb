require 'rubygems/command_manager'
require 'rubygems-source-cli'
require 'rubygems-source-cli/command'

Rubygems::Source::CLI::COMMANDS.each do |cmd|
  filename   = "#{cmd}_command"
  const_name = cmd.capitalize.gsub(/_(.)/) { $1.upcase } << "Command"
  
  require "rubygems-source-cli/commands/#{filename}"
  require "rubygems/commands/#{filename}"
  
  klass = Gem::Commands.const_get(const_name)
  klass.send(:include, Rubygems::Source::CLI::CommandPatch)
  klass.send(:include, Rubygems::Source::CLI.const_get(const_name))
end
