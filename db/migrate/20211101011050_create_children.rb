class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :parent_id

      t.timestamps
    end
  end
end
