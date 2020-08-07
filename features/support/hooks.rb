require 'page-object'

Before do
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 120 # instead of the default 60

  $browser_name == :chrome
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('disable-dev-shm-usage')
  options.add_preference('geolocation.default_content_setting', 1)
  @browser = Watir::Browser.new $browser_label, :options => options
  screen_width = @browser.execute_script('return screen.width;')
  screen_height = @browser.execute_script('return screen.height;')
  @browser.driver.manage.window.resize_to(screen_width,screen_height)

  $test_start = Time.now

  # This will set the default locale of Faker to the United States, using English.
  # For further information on locales in Faker, refer to the following link:
  # https://github.com/faker-ruby/faker/blob/master/lib/locales/README.md
  Faker::Config.locale = 'en-US'
end