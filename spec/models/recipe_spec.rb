require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'User inharitans from ApplicationRecord' do
    expect(Recipe < ApplicationRecord).to eq(true)
  end
end
