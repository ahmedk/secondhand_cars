class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :description
      t.int :price
      t.date :year
      t.int :seats
      t.int :doors

      t.timestamps
    end
  end
end
