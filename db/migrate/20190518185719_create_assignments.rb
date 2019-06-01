class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :difficulty
      t.string :course_id
      t.string :submission_id
      t.string :user_id
      t.timestamps
    end
  end
end
