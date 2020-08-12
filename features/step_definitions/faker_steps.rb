require 'faker'

Given(/^the user goes to (.*)$/) do |site|
  case site
  when 'the Password page'
    @browser.goto 'https://the-internet.herokuapp.com/forgot_password'
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