class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy

  validates :name, :measurement_unit, presence: true
end
