require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe '#full_name' do
    let(:employee) { described_class.create(first_name: 'Foo', last_name: 'Bar') }
    it 'shoud return full name of employee' do
      employee = described_class.create(first_name: 'Foo', last_name: 'Bar')

      expect(employee.full_name).to eq('Foo Bar')
    end
  end
end
