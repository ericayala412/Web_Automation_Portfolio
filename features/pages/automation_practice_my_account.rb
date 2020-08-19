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

  # Helper method that selects random values from the Date Of Birth dropdowns:
  # Days are 1 - 30
  # Months are January - December
  # Years are 1900 - 2020
  def date_of_birth
    sleep 1 # Test goes to fast before selecting a dropdown item
    @browser.div(:id, 'uniform-days').options.to_a.sample.select
    @browser.div(:id, 'uniform-months').options.to_a.sample.select
    @browser.div(:id, 'uniform-years').options.to_a.sample.select
  end

  # Identifies the Company field on the Sign Up page
  def customer_company
    @browser.input(:id, 'company')
  end

  # Identifies the first Address field on the Sign Up page
  def customer_address1
    @browser.input(:id, 'address1')
  end

  # Identifies the second Address field on the Sign Up page
  def customer_address2
    @browser.input(:id, 'address2')
  end

  # Identifies the city field on the Sign Up page
  def customer_city
    @browser.input(:id, 'city')
  end

  # Helper method that selects a random US state
  def customer_state
    sleep 1 # Test goes too fast before selecting a state
    @browser.div(:id, 'uniform-id_state').options.to_a.sample.select
  end

  # Identifies the zip code field on the Sign Up page
  def customer_zip
    @browser.input(:id, 'postcode')
  end

  # Identifies the "Additional Information" section of the Sign Up page
  def additional_information
    @browser.textarea(:id, 'other')
  end

  # Identifies the home phone field on the Sign Up page
  def customer_home_phone
    @browser.input(:id, 'phone')
  end

  # Identifies the mobile phone field on the Sign Up page
  def customer_mobile_phone
    @browser.input(:id, 'phone_mobile')
  end

  # Defines the Register button on the Sign Up page
  def register_button
    @browser.button(:id, 'submitAccount')
  end
end
