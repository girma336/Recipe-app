class CreateReacipFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :reacip_foods do |t|
      t.integer :quantity
      t.references :recipe, null: false, foriegn_key: { to_table: :recipes }
      t.references :food, null: false, foriegn_key: { to_table: :foods }
      t.timestamps
    end
  end
end
