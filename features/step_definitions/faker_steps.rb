require 'faker'

Given(/^the user goes to (.*)$/) do |site|
  case site
  when 'the Internet\'s Forgot Password page'
    @browser.goto 'https://the-internet.herokuapp.com/forgot_password'
  when 'automationpractice.com\'s My Account page'
    @browser.goto 'http://automationpractice.com/index.php?controller=authentication&back=my-account'
  else
    raise 'Select a correct page destination from the case statement'
  end
end

When(/^the user submits a dynamic email with Faker$/) do
  on(ForgotPasswordPage) do |page|
    page.email_field.send_keys Faker::Internet.email
    page.retrieve_password_button.click
  end
end

Then(/^the Forgot Password email will be set$/) do
  expect(@browser.text.include?("Your e-mail's been sent!")).to be true
end

When(/^the user signs up with Faker values$/) do
  on(MyAccountPage) do |page|
    # Completes the first portion of the Sign Up process
    email = Faker::Internet.email
    page.email_address.send_keys email
    page.create_an_account_button.click
    # Completes the second portion of the Sign Up process where the user
    # enters their information and submits
    page.select_random_title
    page.customer_first_name.send_keys Faker::Name.first_name_neutral
    page.customer_last_name.send_keys Faker::Name.last_name
    # The email is pre-populated from the previous step. This assertion
    # will confirm that the email is present in the email field
    expect(page.customer_email.value).to eql email
    page.customer_password.send_keys Faker::Internet.password(min_length: 5)
  end
end

Then(/^something$/) do
  pending
end