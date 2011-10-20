Feature: yank gem from non-Rubygems.org source
  In order to defend my team from sub-awesome code
  As a gem developer
  I want to yank a bad gem from our local Rubygems source server

  Scenario: yank gem from custom Rubygems source
    Given I have a gem credentials file with a valid api key for host "other.org"
    When I run `gem yank mygem.gem -v 1.0.0 --host https://other.org --key other.org`
    And I am authenticated with host "https://other.org"
