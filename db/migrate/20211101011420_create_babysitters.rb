class CreateBabysitters < ActiveRecord::Migration[6.1]
  def change
    create_table :babysitters do |t|
      t.string :name
      t.integer :age
      t.string :address

      t.timestamps
    end
  end
end
