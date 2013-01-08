class AddFirstNameToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :first_name, :string
  end
end
