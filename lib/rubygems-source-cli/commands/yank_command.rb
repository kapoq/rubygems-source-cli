class Gem::Commands::YankCommand < Gem::Command
  RUBYGEMS_HOST = "rubygems.org"

  def initialize(*args)
    super 'yank', description
    add_version_option("remove")
    add_platform_option("remove")
    add_option('--undo') do |value, options|
      options[:undo] = true
    end
    add_key_option
    add_option(
               '--host HOST',
               'Yank from another gemcutter-compatible host'
               ) do |value, options|
      options[:host] = value
    end
  end
  
  def execute
    sign_into_rubygems if host_is_rubygems? && !Gem.configuration.rubygems_api_key
    version   = get_version_from_requirements(options[:version])
    platform  = get_platform_from_requirements(options)
    
    if !version.nil?
      if options[:undo]
        unyank_gem(version, platform)
      else
        yank_gem(version, platform)
      end
    else
      say "A version argument is required: #{usage}"
      terminate_interaction
    end
  end

  def yank_gem(version, platform)
    say "Yanking gem from #{options[:host] || 'Rubygems.org'}..."
    yank_api_request(:delete, version, platform, "api/v1/gems/yank")
  end
  
  def unyank_gem(version, platform)
    say "Unyanking gem from #{options[:host] || 'Rubygems.org'}..."
    yank_api_request(:put, version, platform, "api/v1/gems/unyank")
  end

  def sign_into_rubygems
    sign_in
  end

  private

  def host_is_rubygems?
    uri = ENV['RUBYGEMS_HOST'] || options[:host] || Gem.host
    URI.parse(uri).host == RUBYGEMS_HOST
  end

  def yank_api_request(method, version, platform, api)
    args = [method, "api/v1/gems"]
    args << options[:host] if options[:host]
    
    name = get_one_gem_name
    response = rubygems_api_request(*args) do |request|
      request.add_field("Authorization", api_key)
      request.set_form_data({'gem_name' => name, 'version' => version, 'platform' => platform})
    end
    say response.body
  end
end
