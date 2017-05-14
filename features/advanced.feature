Feature: Shopping for electronics smartly
  As an electronic enthusiast
  I want to buy electronics
  In order to show how geeky I am
  AC1: Search, Add, Checkout, Pay, Receive Confirmation

  Scenario Outline: Search and Buy products with varying credit cards, shipping and products
    Given I have searched for <product>
    And I have added <product_name> to my cart
    And I begin the checkout process as a guest
    When I enter default billing information
    And I select <shipping> method
    And I pay via <cc_type> using <account> with <cvv>
    And I confirm order <total>
    Then I will receive a confirmation
    Examples:
      | product | product_name        | shipping     | cc_type | account          | cvv  | total  |
      | HTC     | HTC One Mini Blue   | Next Day Air | Amex    | 378282246310005  | 1234 | 110.00 |
      | Adobe   | Adobe Photoshop CS4 | 2nd Day Air  | Visa    | 4111111111111111 | 123  | 95.00  |