Feature: Using Faker to generate dynamic data

  Scenario: Generate an email address from Faker and submit the form
    Given the user goes to the Internet's Forgot Password page
    When the user submits a dynamic email with Faker
    Then the Forgot Password email will be set

  Scenario: Sign up and create an account using Faker values
    Given the user goes to automationpractice.com's My Account page
    When the user signs up with Faker values
    Then something