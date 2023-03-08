class AddNameToCurrentUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :current_users, :name, :string
  end
end
