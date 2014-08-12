class RemoveUsernameFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :username, :string
  end
end
