class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.text :content
      t.integer :assignment_id
      t.timestamps
    end
  end
end
