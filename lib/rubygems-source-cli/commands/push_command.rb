class Gem::Commands::PushCommand < Gem::Command
  RUBYGEMS_HOST = "rubygems.org"
  
  def execute
    sign_into_rubygems if host_is_rubygems? && !Gem.configuration.rubygems_api_key
    send_gem get_one_gem_name
  end

  def sign_into_rubygems
    sign_in
  end

  private

  def host_is_rubygems?
    uri = ENV['RUBYGEMS_HOST'] || options[:host] || Gem.host
    URI.parse(uri).host == RUBYGEMS_HOST
  end
end
