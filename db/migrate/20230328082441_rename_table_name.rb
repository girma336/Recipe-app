class RenameTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :reacip_foods, :recipe_food
  end
end
