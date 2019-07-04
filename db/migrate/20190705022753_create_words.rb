class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name
      t.string :meaning
      t.string :speech
      t.string :example
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :words, [:course_id, :created_at]
  end
end
