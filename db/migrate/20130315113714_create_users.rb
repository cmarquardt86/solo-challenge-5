class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :access_level
      t.string :password_hash
 
      t.timestamps
    end
  end
end
