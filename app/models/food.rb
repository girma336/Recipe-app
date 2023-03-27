class Food < ApplicationRecord
  belongs_to :user, foreign_key: true
  has_many :recipe_food, dependent: :destroy
end
