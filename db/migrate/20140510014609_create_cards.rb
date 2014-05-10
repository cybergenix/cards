class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :note_id
      t.integer :card_type_id
      t.text :front
      t.text :back
      t.datetime :due
      t.integer :position
      t.integer :facebook_friend_id
      t.integer :user_id
      t.float :average_review_time
      t.integer :reviews_count
      t.integer :lapses_count

      t.timestamps
    end
    add_index :cards, :note_id
    add_index :cards, :card_type_id
    add_index :cards, :due
    add_index :cards, :position
    add_index :cards, :facebook_friend_id
    add_index :cards, :user_id
  end
end
