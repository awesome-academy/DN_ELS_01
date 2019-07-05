class CreateLessonDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_details do |t|
      t.string :answer
      t.references :lesson, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
    add_index :lesson_details, [:lesson_id, :created_at]
    add_index :lesson_details, [:lesson_id, :question_id]
  end
end
