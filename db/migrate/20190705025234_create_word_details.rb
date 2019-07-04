class CreateWordDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :word_details do |t|
      t.references :user, foreign_key: true
      t.references :word, foreign_key: true
      t.boolean :is_favorite, default: false
      t.boolean :is_learned, default: false

      t.timestamps
    end
    add_index :word_details, [:user_id, :is_favorite]
    add_index :word_details, [:user_id, :is_learned]
    add_index :word_details, [:user_id, :created_at]
    add_index :word_details, [:user_id, :word_id], unique: true
  end
end
