class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.text :description
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :student_id
      t.integer :teacher_id
      t.integer :location_id

      t.timestamps
    end
  end
end
