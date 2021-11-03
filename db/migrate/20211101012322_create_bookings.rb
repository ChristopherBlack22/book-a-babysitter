class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :parent_id
      t.integer :babysitter_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
