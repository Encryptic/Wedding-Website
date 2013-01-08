class AddWillAttendToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :will_attend, :boolean
  end
end
