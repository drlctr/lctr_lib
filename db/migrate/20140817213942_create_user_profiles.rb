class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.boolean :mail_pref_rev, default: true
      t.boolean :mail_pref_rat, default: true
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
