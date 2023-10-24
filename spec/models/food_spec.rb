require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(name: 'Chicken',
             measurement_unit: 'lbs',
             price: 1.99,
             quantity: 1)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'should have a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).not_to be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'should have a quantity' do
    subject.quantity = nil
    expect(subject).not_to be_valid
  end
end
