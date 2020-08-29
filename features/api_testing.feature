Feature: API Testing

  Scenario: Return a random beer from the Brew Dog API
    Given Brew Dog's Punk API is running
    When the user makes a get in /random
    Then the API will return a random beer