## TBD

The API tests use a gem called [httparty](https://github.com/jnunemaker/httparty) to assist with API calls. Additionally [Geocoder](https://github.com/alexreisner/geocoder) is used to create latitude and longitude out of city names.

All tests are written for Cucumber in the Gherkin "Given, When, Then" syntax.

Additionally this project use the [Page Object Model](https://www.selenium.dev/documentation/en/guidelines_and_recommendations/page_object_models/) to assist with scalability and as a maintenance best practices. 
 
#### Environmental Setup: macOS

In order to run this project it is recommended that you have [Homebrew](http://brew.sh) installed. 

* Ruby: `brew install ruby`
* Bundler: `gem install bundler`
* Cask: `brew tap homebrew/cask`
* Chrome: `brew cask install chrome`
* Chromedriver: `brew cask install chromedriver`

Clone the repository, `cd` in to it, and install the required RubyGems:

```bash
cd ruby_cucumber_example
gem update --system
gem install bundler
bundle install
```

#### Running Tests Within the Terminal

Tests can be ran using Cucumber commands, and all front end tests will be run in Chrome.

* To run all the Features, enter: `bundle exec cucumber`

* To run a single test enter: `bundle exec cucumber features/<FEATURE_NAME>.feature`

* To run a scenario in a feature enter: `bundle exec cucumber features/<FEATURE_NAME>.feature:<SCENARIO_LINE_NO>`