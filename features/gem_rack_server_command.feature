Feature: `gem rack` command
  as a Rubygems publisher
  I want to start a gem server
  so developers can install and manage gems

  Scenario: test
    When I run `gem push foo`
    Then I see the modified command output

  # Scenario: start server
  #   When I run `gem server`
  #   Then I see the server has started

  # Scenario: see help
  #   When I run `gem help server`
  #   Then I see help for the command
