require 'rails_helper'

RSpec.describe Food, type: :model do
  create_food = Food.new(name: 'apple', measurement_unit: 'kilograms', price: 12)
  subject { create_food }
  before { subject.save }

  it 'User inharitans from ApplicationRecord' do
    expect(Food < ApplicationRecord).to eq(true)
  end
  it 'name should not be blank' do
    subject.name = 'apple'
    expect(subject.name).to eq 'apple'
  end
  it 'measurement_unit field should not be blank' do
    subject.measurement_unit = 'kilograms'
    expect(subject.measurement_unit).to eq 'kilograms'
  end
  it 'price must be an integer greater than or equal to 0' do
    subject.price = 3
    expect(subject.price).to be >= 0
  end
end
