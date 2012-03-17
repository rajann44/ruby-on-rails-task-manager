class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, :null => false
      t.text :description
      t.date :due_date
      t.string :priority
      t.boolean :completed, :default => false
      t.integer :user_id
      t.timestamps
    end
    add_index :tasks, :user_id
  end
end 