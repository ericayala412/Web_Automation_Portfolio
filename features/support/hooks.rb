require 'page-object'
require 'rubygems'
require 'watir'

Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('disable-dev-shm-usage')
  options.add_argument('no-sandbox')
  @browser = Watir::Browser.new :chrome, options: options
  screen_width = @browser.execute_script('return screen.width;')
  screen_height = @browser.execute_script('return screen.height;')
  # Returns the size of the current resolution and re-sizes the Chrome window
  # to it in order to run the test in full screen.
  @browser.driver.manage.window.resize_to(screen_width, screen_height)

  # This will set the default locale of Faker to the United States, using English.
  # For further information on locales in Faker, refer to the following link:
  # https://github.com/faker-ruby/faker/blob/master/lib/locales/README.md
  Faker::Config.locale = 'en-US'
end

After do
  @browser.quit
end