# frozen_string_literal: true
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
    first_name = Faker::Name.first_name_neutral
    last_name = Faker::Name.last_name
    @full_name = "#{first_name} #{last_name}"
    page.customer_first_name.send_keys first_name
    page.customer_last_name.send_keys last_name
    # The email is pre-populated from the previous step. This assertion
    # will confirm that the email is present in the email field
    expect(page.customer_email.value).to eql email
    page.customer_password.send_keys Faker::Internet.password(min_length: 5)
    page.date_of_birth
    page.customer_company.send_keys Faker::Music::Phish.song + ' Inc.'
    page.customer_address1.send_keys Faker::Address.street_address
    page.customer_address2.send_keys Faker::Address.secondary_address
    page.customer_city.send_keys Faker::Address.city
    page.customer_state
    page.customer_zip.send_keys Faker::Address.zip_code(state_abbreviation: 'NC') # This site only accepts 5 digits zip codes
    page.additional_information.send_keys Faker::Movies::BackToTheFuture.quote
    page.customer_home_phone.send_keys Faker::PhoneNumber.cell_phone_in_e164
    page.customer_mobile_phone.send_keys Faker::PhoneNumber.cell_phone
    page.register_button.click
  end
end

Then(/^the user is signed in on the My Account page$/) do
  expect(@browser.text.include?("MY ACCOUNT")).to be true
  expect(@browser.text.include?("Sign out")).to be true
  # After signing up the user's full name will be displayed in the upper right hand corner of the page
  expect(@browser.text.include?(@full_name)).to be true
end