Feature: Shopping for electronics
  As a shopper
  I want to search and order stuff
  In order to fuel my shopping addiction

  Scenario: Search and Buy Single Product
    Given I have searched for HTC
    And I have added HTC One Mini Blue to my cart
    And I begin the checkout process as a guest
    When I enter default billing information
    And I select same day shipping
    And I enter payment information
    And I confirm order 110.00
    Then I will receive a confirmation
