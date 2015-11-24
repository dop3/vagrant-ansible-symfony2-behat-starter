Feature: Smoke Test
  In order to access the home page
  As a visitor
  I need to be visit the home url

  Scenario: Visit the home page
    Given I am on "/"
    Then the response status code should be 200