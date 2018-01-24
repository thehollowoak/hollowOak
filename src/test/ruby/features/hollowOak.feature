Feature: Hollow Oak Website
  Scenario: Home page displays items
    Given there is an item in the database
    When I'm on the home page
    Then I should see that item displayed

  Scenario: Item pictures on home page link to item view
    Given I'm on the home page
    When I click an item picture
    Then I should see that item's view page

  Scenario: Add to cart
    Given I'm on an item page
    When I click 'add to cart'
    Then the item will be in my cart

  Scenario: Deactivate Item
    Given I'm on an item page
    When I click 'deactivate'
    Then the item will be in projects instead of home