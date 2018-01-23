Feature: Hollow Oak Website
  Scenario: Home page displays items
    Given there is an item in the database
    When I visit the home page
    Then I should see that item displayed