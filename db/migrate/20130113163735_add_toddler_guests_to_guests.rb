class AddToddlerGuestsToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :toddler_guests, :int
  end
end
