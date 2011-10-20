Feature: per-source API authentication
  In order maintain a thin veneer of security
  As a gem developer
  I want to use the correct key to authenticate with Rubygems sources

  Scenario: authenticate with Rubygems.org with a rubygems.org api key
    Given I have a gem credentials file with a valid rubygems.org api key
    And a gem package named "foo.gem"
    When I run `gem push foo.gem`
    Then I am not prompted to sign into rubygems.org
    Then I am authenticated with host "https://rubygems.org"

  Scenario: authenticate with custom api key
    Given I have a gem credentials file with a valid api key for host "other.org"
    And a gem package named "foo.gem"
    When I run `gem push foo.gem --host https://other.org --key other.org`
    Then I am authenticated with host "https://other.org"

  Scenario: prompted to enter rubygems.org credentials when pushing to rubygems.org without an API key
    Given I have no stored gem credentials 
    And a gem package named "foo.gem"
    When I run `gem push foo.gem`
    Then I am prompted to sign into rubygems.org

  Scenario: not prompted to enter unnecessary rubygems.org credentials
    Given I have no stored gem credentials 
    And a gem package named "foo.gem"
    When I run `gem push foo.gem --host https://notrubygems.org`
    Then I am not prompted to sign into rubygems.org
