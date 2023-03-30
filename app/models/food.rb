class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy

  validates :name, :measurement_unit, presence: true
end
