Feature: warn commands are patched
  In order to manage a shitload of dependencies
  As a developer
  I want to be reminded that I have patched gem commands

  Scenario: see warning in help
    When I read the help for the patched commands
    Then I see a warning they are patched

  Scenario: see warning on execute
    When I run the patched commands
    Then I see a warning they are patched
