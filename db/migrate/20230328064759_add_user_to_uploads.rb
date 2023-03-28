class AddUserToUploads < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :foods, :users
    add_foreign_key :recipes, :users
    add_foreign_key :reacip_foods, :foods
    add_foreign_key :reacip_foods, :recipes
  end
end
