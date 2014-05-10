class CreateCardReviews < ActiveRecord::Migration
  def change
    create_table :card_reviews do |t|
      t.integer :user_id
      t.integer :card_id
      t.string :type
      t.integer :rating
      t.integer :interval
      t.integer :ease
      t.float :time

      t.timestamps
    end
    add_index :card_reviews, :user_id
    add_index :card_reviews, :card_id
    add_index :card_reviews, :type
  end
end
