require 'httparty'
require 'geocoder'
require 'active_support'
require 'active_support/time'

Given(/^the National Weather Services API is running$/) do
  response = HTTParty.get('https://api.weather.gov', {
      headers: {"User-Agent" => "Hourly Forecast Test, eric.ayala412@gmail.com"}
  })
  # Returns the response if the call fails for debugging:
  raise "The API call returned a bad response: #{response}" unless response.code.to_s == '200'
end

When(/^I get latitude and longitude for (.*)$/) do |city|
  # Uses the Geocoder gem to return the latitude and longitude of the city passed in from
  # the Gherkin file. The coordinates are then used to get the grid data needed to form
  # the forecast call:
  # https://www.weather.gov/documentation/services-web-api
  coordinates = Geocoder.search(city).first.coordinates
  response = JSON.parse(HTTParty.get("https://api.weather.gov/points/#{coordinates.join(' ').gsub(' ',',')}", {
      headers: {"User-Agent" => "Hourly Forecast Test, eric.ayala412@gmail.com"}
  }))
  # This API does not return information in the form of a Hash, so I am using JSON.parse
  # to return the hashes for the information I need for the gridID, gridX, and gridY
  @grid_id = response['properties']['gridId']
  @grid_x = response['properties']['gridX']
  @grid_y = response['properties']['gridY']
end

Then(/^I will print out the current forecast for (.*)$/) do |city|
  response = JSON.parse(HTTParty.get("https://api.weather.gov/gridpoints/#{@grid_id}/#{@grid_x},#{@grid_y}/forecast", {
      headers: {"User-Agent" => "Hourly Forecast Test, eric.ayala412@gmail.com"}
  }))
  # This API does not return information in the form of a Hash, so I am using JSON.parse
  # to return the hashes for the information I need for the name of the time frame
  # and the detailed forecast.
  time = response['properties']['periods'][0]['name']
  detailed = response['properties']['periods'][0]['detailedForecast']
  expect(time).not_to be_nil # fails the test if nothing is returns for the time
  expect(detailed).not_to be_nil # fails the test if nothing is returns for the detailed forecast
  # the first character was capitalized in the details, so I downcased it below:
  puts "The weather forecast for #{time.downcase} in #{city} is #{detailed.sub(detailed[0], detailed[0].downcase)}"
end

Then(/^I will print out the hourly forecast for (.*)$/) do |city|
  response = JSON.parse(HTTParty.get("https://api.weather.gov/gridpoints/#{@grid_id}/#{@grid_x},#{@grid_y}/forecast/hourly", {
      headers: {"User-Agent" => "Hourly Forecast Test, eric.ayala412@gmail.com"}
  }))
  # This API does not return information in the form of a Hash, so I am using JSON.parse
  # to return the hashes for the information I need for the name of the time frame
  # and the detailed forecast.
  time_in_utc = response['properties']['periods'][0]['startTime']
  expect(time_in_utc).not_to be_nil # fails the test if nothing is returns for the time
  # Below it sets the UTC time to EST and then formats it to return a more useful time string:
  time_in_est = time_in_utc.in_time_zone('Eastern Time (US & Canada)').strftime('%A, %d %b %Y %l:%M %p')
  temperature = response['properties']['periods'][0]['temperature']
  description = response['properties']['periods'][0]['shortForecast']
  wind_speed = response['properties']['periods'][0]['windSpeed']
  direction = response['properties']['periods'][0]['windDirection']
  # the first character was capitalized in the description, so I downcased it below:
  puts "The hourly forecast for #{city} on #{time_in_est} is #{description.sub(description[0], description[0].downcase)} with a temperature of #{temperature} degrees with a wind speed of #{wind_speed} coming from the #{direction}."
end
