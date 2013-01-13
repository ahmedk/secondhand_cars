class AddFieldsToCar < ActiveRecord::Migration
  def change
    change_table :cars do |t|
      t.integer :mileage
      t.text :transmission
      t.text :type
      t.text :color
      t.integer :capacity
      t.integer :visited, :default => 0
    end
  end
end
