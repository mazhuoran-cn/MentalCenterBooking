class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :string
    add_column :users, :student, :boolean
    add_column :users, :teacher, :boolean
    add_column :users, :admin, :boolean
  end
end
