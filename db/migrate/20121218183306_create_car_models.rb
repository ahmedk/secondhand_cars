class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.string :name, :null => false
      t.references :make
      
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE car_models
        ADD CONSTRAINT fk_models_makes
        FOREIGN KEY (make_id)
        REFERENCES makes(id)
    SQL
  end
end
