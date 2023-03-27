class CreateForiegnKey < ActiveRecord::Migration[7.0]
  def change
    create_table :foriegn_keys do |t|
      add_reference :foods, :user, index: true
      add_reference :recipes, :user, index: true
      add_reference :recipe_foods, :food, index: true
      add_reference :recipe_foods, :recipe, index: true

      t.timestamps
    end
  end
end
