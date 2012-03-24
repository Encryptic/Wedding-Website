class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :code
      t.integer :adult_guests
      t.integer :child_guests
      t.date :rsvp_date
      t.text :notes
      t.text :private_notes

      t.timestamps
    end
  end
end
