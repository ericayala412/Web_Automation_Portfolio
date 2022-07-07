@chrome
Feature: Using Faker to generate dynamic data
  As a user of automated test practice sites
  I want to input data using Faker
  So that I can enter dynamic randomized data when signing up

  # @failing
  # This test is expected to fail due an error on the Forgot Password site
  Scenario: Generate an email address from Faker and submit the form
    Given the user goes to the Internet's Forgot Password page
    When the user submits a dynamic email with Faker
    Then the Forgot Password email will be set

  # @japanese_locale
  Scenario: Sign up and create an account using Faker values
    Given the user goes to automationpractice.com's My Account page
    When the user signs up with Faker values
    Then the user is signed in on the My Account page