# Models out page objects on The Internet's Forgot Password page:
# https://the-internet.herokuapp.com/forgot_password
class ForgotPasswordPage
  include PageObject

  def email_field
    @browser.input(:id, 'email')
  end

  def retrieve_password_button
    @browser.i(:class, 'icon-signin')
  end
end