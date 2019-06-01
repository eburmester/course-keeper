class CreateCompletedAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_assignments do |t|
      t.belongs_to :user
      t.belongs_to :assignment, foreign_key: true
      t.belongs_to :submission, foreign_key: true 
      t.datetime :submitted_on

      t.timestamps
    end
  end
end
