## Web Automation Portfolio

This project was originally created for a [tech talk](https://www.youtube.com/watch?v=yCkzHHV1Spw) I gave on [Faker](https://github.com/faker-ruby/faker) for creating dynamic data for test creation. Since then it has evolved into a portfolio of sorts to showcase some of my web automation skills. 

The project is broken up into different Cucumber feature files and some scripts, each covering a different function for both front end and back end automated testing. All feature files are written for Cucumber in the Gherkin `Given, When, Then` syntax.  

Additionally this project use the [Page Object Model](https://www.selenium.dev/documentation/en/guidelines_and_recommendations/page_object_models/) to assist with scalability and as a maintenance best practices. 

##### Front End Tests:

`angular_todo.feature`: This feature file covers different scenarios for an [Angular To-Do App](http://todomvc.com/examples/angular2/). 

`faker.feature`: This feature file covers sign up tests for sample automation sites and uses Faker for dynamic data generation. Adding `@japanese_locale` or `@german_locale` as a scenario tag will run the test with Faker data from that locale.

##### Back End End Tests and Scripts:

The API tests use a gem called [httparty](https://github.com/jnunemaker/httparty) to assist with API calls. Additionally [Geocoder](https://github.com/alexreisner/geocoder) is used to create latitude and longitude out of city names.

`national_weather_service_api.feature`: Displays the current and hourly forecasts for a given city within the Scenario Outline table.

`generate_people.rb`: Uses Faker to create a JSON of users using dynamically generated data.

#### Environmental Setup: macOS

In order to run this project it is recommended that you have [Homebrew](http://brew.sh) installed. 

* Ruby: `brew install ruby`
* Bundler: `gem install bundler`
* Cask: `brew tap homebrew/cask`
* Chrome: `brew cask install chrome`
* Chromedriver: `brew cask install chromedriver`

Clone the repository, `cd` in to it, and install the required RubyGems:

```bash
cd Web_Automation_Portfolio
gem update --system
gem install bundler
bundle install
```

#### Running Tests Within the Terminal

Tests can be ran using Cucumber commands, and all front end tests will be run in Chrome.

* To run all the Features, enter: `bundle exec cucumber`

* To run a single test enter: `bundle exec cucumber features/<FEATURE_NAME>.feature`

* To run a scenario in a feature enter: `bundle exec cucumber features/<FEATURE_NAME>.feature:<SCENARIO_LINE_NO>`

* To run front end tests headless: change the `@chrome` tag at the top of any feature file to `@headless`