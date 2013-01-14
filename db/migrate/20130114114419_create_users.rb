class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :password_digest
      t.references :owner

      t.timestamps
    end
  end
end
