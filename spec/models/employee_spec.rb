require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe '#full_name' do
    let(:employee) { FactoryBot.build(:employee, first_name: 'Donald', last_name: 'Trump') }

    it 'shoud return full name of employee' do
      expect(employee.full_name).to eq('Donald Trump')
    end
  end

  describe '#validation' do
    context 'when first_name empty' do
      let(:employee) { FactoryBot.build(:employee, first_name: nil) }

      it 'should return not-valid when saving' do
        expect { employee.save }.to change { Employee.count }.by(0)
      end
    end

    context 'when last_name empty' do
      let(:employee) { FactoryBot.build(:employee, last_name: nil) }

      it 'should return not-valid when saving' do
        expect { employee.save }.to change { Employee.count }.by(0)
      end
    end
  end
end
