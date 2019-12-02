class RemoveAdminTeacherStudentFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin
    remove_column :users, :teacher
    remove_column :users, :student
    add_column :users, :type, :string
  end
end
