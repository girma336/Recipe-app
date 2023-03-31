require 'rails_helper'
RSpec.describe 'Inventories', type: :feature do
  include Devise::Test::IntegrationHelpers
  subject { User.new(name: 'User1', email: 'test@gmail.com', password: 'password') }
  before { subject.skip_confirmation! }
  before { subject.save }
  let(:inventory) do
    Inventory.create(name: 'Inventory 1', user_id: subject.id)
  end
  describe 'GET /index' do
    before do
      sign_in subject
    end
    it 'should check if inventory with name "Inventory 1" exists' do
      expect(inventory.name).to eq('Inventory 1')
    end
  end
end
