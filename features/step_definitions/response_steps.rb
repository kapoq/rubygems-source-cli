Then /^I am authenticated with host "([^"]*)"$/ do |host|
  assert_partial_output("Authenticated successfully with #{host}", all_output)
end

Then /^I am prompted to sign into rubygems\.org$/ do
  assert_partial_output("Enter your RubyGems.org credentials.", all_output)
end

Then /^I am not prompted to sign into rubygems\.org$/ do
  assert_no_partial_output("Enter your RubyGems.org credentials.", all_output)
end
