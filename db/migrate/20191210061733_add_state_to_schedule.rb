class AddStateToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :state, :integer
  end
end
