require 'rubygems/command_manager'
require 'rubygems/command'
require 'rubygems-source-cli'
require 'rubygems-source-cli/command_patch'

#
# Load files and apply patches for each command
#
Rubygems::Source::CLI::COMMANDS.each do |cmd|
  filename   = "#{cmd}_command"
  const_name = cmd.capitalize.gsub(/_(.)/) { $1.upcase } << "Command"
  
  require "rubygems/commands/#{filename}"
  require "rubygems-source-cli/commands/#{filename}"
  
  klass = Gem::Commands.const_get(const_name)
  klass.send(:include, Rubygems::Source::CLI::CommandPatch)
end
