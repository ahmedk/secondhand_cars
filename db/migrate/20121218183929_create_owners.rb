class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :phone
      t.string :mobile, :null => false

      t.timestamps
    end
  end
end
