require 'httparty'

Given(/^Brew Dog's Punk API is running$/) do
  @response = HTTParty.get('https://api.punkapi.com/v2/beers')
  expect(@response.code.to_s.include?('200')).to be true
  expect(@response.code.to_s.include?(%w[400 401 403 404 405 409 500 503].to_s)).to be false
end

When(/^the user makes a get in (.*)$/) do |route|
  @response = HTTParty.get("https://api.punkapi.com/v2/beers#{route}")
end

Then(/^the API will return a random beer$/) do
  data = @response.parsed_response
  data.each do |item|
    puts item['name']
    puts item['tagline']
    puts item['description']
  end
end

When(/^the user requests all beers containing (.*) hops$/) do |hops|
  @response = HTTParty.get("https://api.punkapi.com/v2/beers?ingredients&hops=#{hops}", format: :json)
end

Then(/^the API will return the beer$/) do
  data = @response.parsed_response
  data.each do |item|
    puts item['name']
    puts item['ingredients']['hops']
  end
end
