Feature: Verify the functionality of the National Weather Services API
  As a user of the National Weather Services API,
  I want to access weather data
  So that I can receive relevant weather information

  Scenario Outline: Print out the current forecast for a given city
    Given the National Weather Services API is running
    When I get latitude and longitude for <city>
    Then I will print out the current forecast for <city>

    Examples:
      | city                      |
      | Raleigh, North Carolina   |
      | Pittsburgh, Pennsylvania  |
      | Asheville, North Carolina |

  Scenario Outline: Print out the hourly forecast for a given city by hitting the hourly endpoint
    Given the National Weather Services API is running
    When I get latitude and longitude for <city>
    Then I will print out the hourly forecast for <city>

    Examples:
      | city                       |
      | New York, New York         |
      | Charleston, South Carolina |
      | Baltimore, Maryland        |