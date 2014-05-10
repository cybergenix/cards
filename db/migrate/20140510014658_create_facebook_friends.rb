class CreateFacebookFriends < ActiveRecord::Migration
  def change
    create_table :facebook_friends do |t|
      t.string :name
      t.string :photo
      t.string :work
      t.string :location
      t.string :birthday
      t.string :college
      t.string :significant_other
      t.integer :user_id
      t.integer :facebook_id

      t.timestamps
    end
    add_index :facebook_friends, :name
    add_index :facebook_friends, :user_id
    add_index :facebook_friends, :facebook_id
  end
end
