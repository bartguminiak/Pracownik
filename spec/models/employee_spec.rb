require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe '#full_name' do
    let(:employee) { FactoryBot.build(:employee, first_name: 'Donald', last_name: 'Trump') }

    it 'shoud return full name of employee' do
      expect(employee.full_name).to eq('Donald Trump')
    end
  end

  describe '#validation' do
    let(:employee) { FactoryBot.build(:employee) }

    it 'shoud return full name of employee' do
      expect(employee.full_name).to eq('Donald Trump')
    end
  end
end
