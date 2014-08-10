class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id
      t.string :username
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
