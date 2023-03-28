class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy

  validates :name, :measurement_unit, :user_id, presence: true
end
