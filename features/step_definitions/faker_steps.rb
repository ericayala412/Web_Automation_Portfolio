Given(/^the user goes to (.*)$/) do |site|
  case site
  when 'the Password page'
    @browser.goto 'https://the-internet.herokuapp.com/forgot_password'
  else
    raise 'Select a correct page destination from the case statement'
  end
end

When(/^blah$/) do
  pending
end