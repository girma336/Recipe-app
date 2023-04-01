class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :preparation_date
      t.string :cooking_time
      t.text :description
      t.boolean :public, default: false
      t.references :user, null: false, foriegn_key: { to_table: :users }

      t.timestamps
    end
  end
end
class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price,  precision: 8, scale: 2
      t.integer :quantity
      t.boolean :public, default: false
      t.references :user, null: false, foriegn_key: { to_table: :users }

      t.timestamps
    end
  end
end
