class CreateCardTypes < ActiveRecord::Migration
  def change
    create_table :card_types do |t|
      t.integer :note_id
      t.string :title
      t.text :front_template
      t.text :back_template
      t.text :styling

      t.timestamps
    end
    add_index :card_types, :note_id
  end
end
