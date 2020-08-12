require 'faker'

Given(/^the user goes to (.*)$/) do |site|
  case site
  when 'the Password page'
    @browser.goto 'https://the-internet.herokuapp.com/forgot_password'
  else
    raise 'Select a correct page destination from the case statement'
  end
end

When(/^blah$/) do
  on(ForgotPasswordPage) do |page|
    page.email_field.send_keys Faker::Internet.user_name
    puts 'yay'
  end
end