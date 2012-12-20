class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.string :name, :null => false
      t.references :make
      
      t.timestamps
    end
  end
end
