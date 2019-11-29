class AddDetailsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :begin_time, :datetime
    add_column :rooms, :end_time, :datetime
    add_column :rooms, :campus, :string
    add_column :rooms, :office, :string
  end
end
