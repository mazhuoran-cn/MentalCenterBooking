class AddIndexToUsersEmailAndSchoolId < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    add_index :users, :school_id, unique: true
  end
end
