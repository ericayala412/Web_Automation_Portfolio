require 'airborne'
require 'spec_helper'

describe 'Beers Endpoint:' do
  describe 'When I am an API user and I send a valid response, the Coordinates API' do
    it 'should return the valid JSON types with a successful response' do
      get 'beers'
      expect_status(200)
      expect_json_types(:array)
    end
  end
end





