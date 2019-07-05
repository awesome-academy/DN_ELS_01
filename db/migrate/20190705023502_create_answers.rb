class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_right, default: false
      t.string :code
      t.references :question, foreign_key: true

      t.timestamps
    end
    add_index :answers, [:question_id, :code]
    add_index :answers, [:question_id, :content]
    add_index :answers, [:question_id, :created_at]
  end
end
