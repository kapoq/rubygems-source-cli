class Gem::Commands::ServerCommand < Gem::Command
  def description
    "Rack rubygems API endpoint"
  end

  def usage
    "gem rack"
  end

  def arguments
    "none"
  end

  def execute
    puts "Server started"
  end
  
  def initialize
    super "rack", description
  end
end

Gem::CommandManager.instance.register_command :server
