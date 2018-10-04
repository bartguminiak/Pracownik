require 'rails_helper'

RSpec.describe 'Employee API' do
  describe 'GET /employees' do
    xit 'returns list of employees' do
      get '/employees'
    end

    it 'returns HTTP 200 status' do
        get '/employees'

        expect(response.status).to eq(200)
    end
  end
end