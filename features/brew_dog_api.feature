Feature: Test API responses and return values

  Scenario: Return a random beer from the Brew Dog API
    Given Brew Dog's Punk API is running
    When the user makes a get in /random
    Then the API will return a random beer

  Scenario Outline: Find beers based on their type of hops
    Given Brew Dog's Punk API is running
    When the user requests all beers containing <type> hops
    Then the API will return the beer

    Examples:
      | type     |
      | Simcoe   |
      | Amarillo |
      | Fuggles  |