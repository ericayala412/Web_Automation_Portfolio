# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'airborne'

# This configuration allows you to pass in the base URL for the API
# which in this case is localhost when running the API from Docker.
Airborne.configure do |config|
  config.base_url = 'https://api.punkapi.com/v2/'
end

# This is used for successful responses from the API which is passed into the
# api_spec.rb file.
#GET_beers = 'beers'
