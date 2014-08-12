class RemoveEmailFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :email, :string
  end
end
