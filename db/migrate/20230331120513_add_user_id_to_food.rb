class AddUserIdToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :user, references: :user, foreign_key: true
  end
end
