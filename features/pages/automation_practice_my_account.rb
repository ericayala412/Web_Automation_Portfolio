# Models out page objects on automationpractice.com's My Account page:
# http://automationpractice.com/index.php?controller=authentication&back=my-account
class MyAccountPage
  include PageObject

  # Identifies the email address text field on the My Account page
  def email_address
    @browser.input(:class, /is_required validate account_input form-control/)
  end

  # Identifies the Create An Account button on the My Account page
  def create_an_account_button
    @browser.button(:id, 'SubmitCreate')
  end

  # Helper method that selects a Title of the user at random from
  # Mr. or Mrs. within the Sign Up page
  def select_random_title
    title_ids = %w[id_gender1 id_gender2]
    @browser.radio(:id, "#{title_ids.sample}").set
  end

  # Identifies the Customer's first name on the Sign Up page
  def customer_first_name
    @browser.input(:id, 'customer_firstname')
  end

  # Identifies the Customer's last name on the Sign Up page
  def customer_last_name
    @browser.input(:id, 'customer_lastname')
  end

  # Identifies the Customer's email on the Sign Up page
  def customer_email
    @browser.input(:id, 'email')
  end

  # Identifies the Customer's password on the Sign Up page
  def customer_password
    @browser.input(:id, 'passwd')
  end
end
