class AddStatusToBook < ActiveRecord::Migration
  def change
    add_column :books, :status, :string, default: "submitted"
  end
end
