require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  subject { User.new(name: 'Girma', email: 'test@gmail.com', password: 'password', role: 'user') }

  before :each do
    @user = User.new(name: 'Girma', email: 'test@gmail.com', password: 'password', role: 'user')
    @user.skip_confirmation!
    @user.save
    @inventory = Inventory.create(name: 'firstIv', user_id: @user.id)
    @food = Food.create(name: 'Pizza', measurement_unit: 'slice', price: 25)
  end
  it 'Should be inhart form ApplicationRecord' do
    expect(InventoryFood < ApplicationRecord).to eq(true)
  end
  it 'not valid without quantity' do
    inventory_food = InventoryFood.new(inventory_id: @inventory.id, food_id: @food.id)
    expect(inventory_food).to_not be_valid
  end
end
