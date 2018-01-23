Feature: Hollow Oak Website
  Scenario: Home page displays items
    Given there is an item in the database
    When I'm on the home page
    Then I should see that item displayed

  Scenario: Item pictures on home page link to item view
    Given I'm on the home page
    When I click an item picture
    Then I should see that item's view page