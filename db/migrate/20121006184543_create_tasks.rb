class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.references :employer

      t.timestamps
    end
    add_index :tasks, :employer_id
  end
end
