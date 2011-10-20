require 'webmock'

#
# Disable all net access
#
WebMock.disable_net_connect!

#
# Stub out expected requests
#
include WebMock::API

stub_request(:post, "https://rubygems.org/api/v1/gems").with(:headers => {'Authorization'=>'valid_key_for_rubygems_api_key'}).to_return(:status => 200, :body => "Authenticated successfully with https://rubygems.org", :headers => {})

stub_request(:post, "https://other.org/api/v1/gems").with(:headers => {'Authorization'=>'valid_key_for_other.org'}).to_return(:status => 200, :body => "Authenticated successfully with https://other.org", :headers => {})


stub_request(:delete, "https://other.org/api/v1/gems").with(:headers => {'Authorization'=>'valid_key_for_other.org'}).to_return(:status => 200, :body => "Authenticated successfully with https://other.org", :headers => {})

#
# Overwrite credentials_path so Gem users test credentials file created by Aruba
#
class Gem::ConfigFile
  def credentials_path
    File.expand_path(File.join(File.dirname(__FILE__), "..", "tmp", "aruba", "credentials"))
  end
end
