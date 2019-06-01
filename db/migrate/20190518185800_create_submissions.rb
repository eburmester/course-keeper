class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.text :content
      t.string :assignment_id
      t.string :user_id
      t.timestamps
    end
  end
end
