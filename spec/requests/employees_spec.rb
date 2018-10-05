require 'rails_helper'

RSpec.describe 'Employee API' do

  before(:all) do
    Employee.destroy_all
    FactoryBot.create_list(:employee, 3)
  end

  describe 'GET /employees' do
    subject(:request) { get '/employees' }

    it 'returns list of employees' do
      request

      expect(json_response['employees'].length).to eq(3)
    end

    it 'returns HTTP 200 status' do
      request

      expect(response.status).to eq(200)
    end
  end


  describe 'GET /employees/:id' do
    subject(:request) { get "/employees/#{id}" }
      let(:id) { employee.id }
      let(:employee) { FactoryBot.create(:employee, first_name: 'Robert', last_name: 'Lewandowski') }
      it 'returns HTTP 200 status' do
        request

        expect(response.status).to eq(200)
      end

      it 'return correct employee' do
        request

        expect(json_response['full_name']).to eq('Robert Lewandowski')
      end

    context 'with incorrect id' do
      let(:id) { 'wfthrd' }
      let(:employee) { FactoryBot.create(:employee) }
      it 'returns HTTP 404 status' do
        request

        expect(response.status).to eq(404)
      end
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end