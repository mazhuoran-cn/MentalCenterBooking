class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.boolean :using
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
