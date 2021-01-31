require 'airborne'
require 'spec_helper'

describe 'Beers Endpoint:' do
  describe 'When I am an API user and I send a valid response, the Coordinates API' do
    it 'should return the valid JSON types with a successful response' do
      get 'beers'
      expect_status(200)
      expect_json_types(:array)
      # Using '*' because this API returns all result into an array:
      expect_json_types('*', id: :integer, name: :string)
    end
  end
end








#
# describe 'Coordinates Endpoint' do
#   describe 'When I am an API user and I send a valid response, the Coordinates API' do
#     # This test verifies that the proper status is returned with a valid request.
#     # Additionally, it checks that the valid types of the objects returned in the JSON.
#     it 'should return the valid JSON types with a successful response' do
#       get GET_point
#       expect_status(200) # Since this a valid request, it should return a 200
#       expect_json_types(points: :array)
#       expect_json_types('points.*', placeGuid: :string)
#       expect_json_types('points.*.coordinates', lat: :float, lon: :float) # In Ruby, imprecise numbers are designated as floats
#     end
#
#     # This test checks for the existence of the correct keys in the JSON object
#     # if a valid request is made.
#     it 'should return the correct keys in a successful response' do
#       get GET_point
#       expect_json_keys('points.*', [:placeGuid, :coordinates])
#       expect_json_keys('points.*.coordinates', [:lat, :lon])
#     end
#
#     # This test checks that a valid JSON properties are returns if you send
#     # a valid GET request to the API.
#     it 'should return the correct values of a successful response' do
#       get GET_point
#       expect_json('points.*', placeGuid: '1120d485-4316-4326-b493-07b17be742b8')
#       expect_json('points.*.coordinates', lat: 30.802315, lon: -95.105376)
#     end
#
#     # This test checks for a case where the JSON property sizes that are returned
#     # for the coordinates are equal 2.
#     it 'should return the correct size of coordinates in a successful response' do
#       get GET_point
#       expect_json_sizes('points.*.coordinates', 2)
#     end
#
#     # This test checks that the proper content type is returned.
#     it 'gets the proper headers' do
#       get GET_point
#       expect_header('content_type', 'application/json; charset=utf-8') # this is the expected header with a GET request
#     end
#
#     # The expected range for latitude and longitude is between -180 and 180.
#     # This test will look to see if values returned are within that range for both coordinates.
#     it 'returns a latitude and longitude that is between -180 and 180' do
#       # Uses the RSpec matcher for be_between
#       # https://www.rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers:be_between
#       get GET_point
#       expect_json('points.*.coordinates', lat: -> (lat){ expect(lat).to be_between(-180, 180) })
#       expect_json('points.*.coordinates', lat: -> (lon){ expect(lon).to be_between(-180, 180) })
#     end
#   end
#
#   describe 'When I am an API user and I send an invalid response, the Coordinates API' do
#     # This test checks that the proper status is returned (in this case a 405)
#     # when attempting to send a POST request to the endpoint.
#     it 'gets the proper error code when attempting to make a POST request' do
#       post GET_point
#       expect_status(405)
#     end
#   end
# end

