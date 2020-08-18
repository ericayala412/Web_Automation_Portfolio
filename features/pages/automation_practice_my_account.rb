# Models out page objects on automationpractice.com's My Account page:
# http://automationpractice.com/index.php?controller=authentication&back=my-account
class MyAccountPage
  include PageObject

  # Identifies the email address text field on the My Account page
  def email_address
    @browser.input(:class, /is_required validate account_input form-control/)
  end

  # Identifies the Create An Account button on the My Account page
  def create_an_account
    @browser.button(:id, 'SubmitCreate')
  end
end
