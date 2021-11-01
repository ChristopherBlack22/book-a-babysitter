class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :child_id
      t.integer :babysitter_id
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
