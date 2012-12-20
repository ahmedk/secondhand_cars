class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.text :description, :null => false
      t.integer :price, :null => false
      t.integer :year, :null => false
      t.integer :seats
      t.integer :doors
      t.boolean :sold, :default => false
      t.references :car_model
      t.references :owner

      t.timestamps
    end
  end
end
