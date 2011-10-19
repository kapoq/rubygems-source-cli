When /^I read the help for the patched commands$/ do
  @output = {}
  Rubygems::Source::CLI::COMMANDS.each do |command|
    run_simple("gem help #{command}")
    @output[command] = all_stdout
  end
end

When /^I run the patched commands$/ do
  @output = {}
  Rubygems::Source::CLI::COMMANDS.each do |command|
    # Don't want wait for the command to execute successfully,
    # so force an error by passing an invalid option
    run_simple("gem #{command} --invalid-option-to-force-error", false)
    @output[command] = all_output
  end
end

Then /^I see a warning they are patched$/ do
  @output.each do |cmd, s|
    unescape(s).should include("patched by rubygems-source-cli")
  end
end
