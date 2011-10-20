Then /^I am authenticated$/ do
  assert_partial_output("Authenticated successfully", all_output)
end

Then /^I am prompted to sign into Rubygems\.org$/ do
  assert_partial_output("Enter your RubyGems.org credentials.", all_output)
end

Then /^I am not prompted to sign into Rubygems\.org$/ do
  assert_no_partial_output("Enter your RubyGems.org credentials.", all_output)
end
