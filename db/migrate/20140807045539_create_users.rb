class CreateUsers < ActiveRecord::Migration
  def change
  	drop_table :users
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	t.string :password

      t.timestamps
    end
  end
end
