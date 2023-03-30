require 'rails_helper'
RSpec.describe 'Recipe Foods', type: :feature do
  include Devise::Test::IntegrationHelpers
  subject { User.new(name: 'Girma', email: 'test@gmail.com', password: 'password') }
  before { subject.skip_confirmation! }
  before { subject.save }
  let(:food) { Food.create(user_id: subject.id, name: 'Apple', measurement_unit: 'kg', price: 12) }
  let(:recipe) do
    Recipe.create(name: 'Pizza', cooking_time: '1', preparation_date: '2', description: 'description', public: false,
                  user_id: subject.id)
  end
  let(:recipe_food) { RecipeFood.create(quantity: 10, food_id: subject.id, recipe_id: recipe.id) }
  describe 'GET /index' do
    before do
      sign_in subject
    end
    it 'should check if recipe with name "Pizza" exists' do
      expect(recipe.name).to eq('Pizza')
    end
    it 'should check prepationTime of recipe with name "Pizza"' do
      expect(recipe.preparation_date).to eq('2')
    end
    it 'should check Preparation Time of recipe with name "Pizza"' do
      expect(recipe.cooking_time).to eq('1')
    end
    it 'should check if recipe_food with quantity 10 exists' do
      expect(recipe_food.quantity).to eq(10)
    end
  end
end
