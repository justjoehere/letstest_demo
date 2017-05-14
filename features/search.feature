Feature: Play with search
  blah blah blah

  Scenario Outline: Test search with non-sensical characters
    Given I have searched for <string>
    Then I a list of products
    Examples:
      | string   |
      | HTC      |
      | O'Malley |
      | Adobe    |