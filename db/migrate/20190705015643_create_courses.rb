class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :duration
      t.integer :question_num

      t.timestamps
    end
    add_index :courses, :name, unique: true
  end
end
