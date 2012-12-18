class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.text :description, :null => false
      t.int :price, :null => false
      t.date :year, :null => false
      t.int :seats
      t.int :doors
      t.boolean :sold, :default => false
      t.references :car_model
      t.references :owner

      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE cars
        ADD CONSTRAINT fk_models_cars
        FOREIGN KEY (car_model_id)
        REFERENCES car_models(id)
        ADD CONSTRAINT fk_owners_cars
        FOREIGN KEY (owner_id)
        REFERENCES owners(id)
    SQL
  end
end
