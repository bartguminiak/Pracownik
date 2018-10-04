require 'rails_helper'

RSpec.describe 'Employee API' do
  describe 'GET /employees' do
    subject(:request) { get '/employees' }

    before(:all) do
      Employee.destroy_all
      FactoryBot.create_list(:employee, 3)
    end

    it 'returns list of employees' do
      request

      expect(json_response['employees'].length).to eq(3)
    end

    it 'returns HTTP 200 status' do
      request

      expect(response.status).to eq(200)
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end