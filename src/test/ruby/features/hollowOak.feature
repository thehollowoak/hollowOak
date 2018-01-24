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

  Scenario: Plus Button in cart
    Given I put 1 of an item in the cart
    When I click the plus button
    Then there are 2 of the item in the cart

  Scenario: Minus Button in cart
    Given I put 2 of an item in the cart
    When I click the minus button
    Then there is 1 of the item in the cart

  Scenario: Item removed from cart at amount 0
    Given I put 1 of an item in the cart
    When I click the minus button
    Then the item is no longer in the cart

  Scenario: Deactivate Item
    Given I'm on an item page
    When I click 'deactivate'
    Then the item will be in projects instead of home