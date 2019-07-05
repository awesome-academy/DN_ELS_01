class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.references :word, foreign_key: true

      t.timestamps
    end
    add_index :questions, [:word_id, :created_at]
  end
end
