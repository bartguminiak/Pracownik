require 'rails_helper'

RSpec.describe 'Employee API' do

  describe 'GET /employees' do
    before(:each) do
      FactoryBot.create_list(:employee, 3)
    end

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

  describe 'POST /employees' do
      subject(:request) { post '/employees', params: input }
      let(:input) { { first_name: 'Brad', last_name: 'Pitt' } }

      it 'returns HTTP 201 status' do
        request

        expect(response.status).to eq(201)
      end

      it 'returns employee with passed arguments' do
        request

        expect(json_response['full_name']).to eq('Brad Pitt')
      end

      it 'inserts new employee to database', :aggregate_failures do
        expect { request }.to change { Employee.count }.by(1)
        db_employee = Employee.last
        expect(db_employee.first_name).to eq('Brad')
        expect(db_employee.last_name).to eq('Pitt')
      end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end