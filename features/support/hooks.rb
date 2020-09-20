require 'page-object'
require 'rubygems'
require 'watir'

Before('@headless') do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('headless')
  options.add_argument('disable-dev-shm-usage')
  options.add_argument('no-sandbox')
  options.add_argument('window-size=1960x1440')
  @browser = Watir::Browser.new :chrome, :options => options
end

Before('@chrome') do
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

# When adding the Cucumber tag '@german_locale' to a scenario, that scenario will use
# German values to names, addresses, etc. For the full list please reference:
# https://github.com/faker-ruby/faker/blob/master/lib/locales/de.yml
Before('@german_locale') do
  Faker::Config.locale = 'de'
end

# When adding the Cucumber tag '@russian_locale' to a scenario, that scenario will use
# Russian values in Cyrillic to names, addresses, etc. For the full list please reference:
# https://github.com/faker-ruby/faker/blob/master/lib/locales/ru.yml
Before('@russian_locale') do
  Faker::Config.locale = 'ru'
end

# When adding the Cucumber tag '@japanese_locale' to a scenario, that scenario will use
# Japanese values in Kanji to names, addresses, etc. For the full list please reference:
# https://github.com/faker-ruby/faker/blob/master/lib/locales/ja.yml
Before('@japanese_locale') do
  Faker::Config.locale = 'ja'
end

After('@chrome') do
  @browser.quit
end

After('@headless') do
  @browser.quit
end
