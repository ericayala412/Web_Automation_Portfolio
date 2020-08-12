Feature: Using Faker to generate dynamic data

  Scenario: Generate an email address from Faker and submit the form
    Given the user goes to the Password page
    When the user submits a dynamic email with Faker
    Then the Forgot Password email will be set