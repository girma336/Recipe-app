class RenameTableNameRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipe_food, :recipe_foods
  end
end
