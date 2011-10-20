Given /^a gem package named "([^"]*)"$/ do |package_name|
  write_file(package_name, "fake")
end

Given /^I have a gem credentials file with a valid rubygems\.org api key$/ do
  @key = create_valid_api_key("rubygems_api_key")
end

Given /^I have a gem credentials file with a valid api key for host "([^"]*)"$/ do |host|
  @key = create_valid_api_key(host)
end

Given /^I have no stored gem credentials$/ do
  delete_gem_credentials
end
