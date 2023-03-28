class AddCoulmnToFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :preparation_date
    remove_column :foods, :cooking_time
    remove_column :foods, :description
    remove_column :foods, :public
    add_column :foods, :price, :decimal, precision: 8, scale: 2
    add_column :foods, :quantity, :integer
  end
end
