# Models out page objects on The Internet's Forgot Password page:
# https://the-internet.herokuapp.com/forgot_password
class ForgotPasswordPage
  include PageObject

  # Identifies the email text field on the Forgot Password page
  def email_field
    @browser.input(:id, 'email')
  end

  # Identifies the Retrieve Password button on the Forgot Password page
  def retrieve_password_button
    @browser.i(:class, 'icon-signin')
  end
end
