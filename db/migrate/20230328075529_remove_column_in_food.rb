class RemoveColumnInFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :quantity
    remove_foreign_key :foods, :users
    remove_reference :foods, :user, index: false
  end
end
