class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :mode, default: 0

      t.timestamps
    end
    add_index :lessons, [:user_id, :created_at]
    add_index :lessons, [:course_id, :created_at]
    add_index :lessons, [:user_id, :course_id]
  end
end
