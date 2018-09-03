class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :max_speed

      t.timestamps
    end
  end
end
