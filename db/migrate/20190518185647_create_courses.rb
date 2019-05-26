class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :created_on
      t.string :created_by

      t.timestamps
    end
  end
end
