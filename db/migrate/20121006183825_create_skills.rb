class CreateSkills < ActiveRecord::Migration[4.2]
  def change
    create_table :skills do |t|
      t.string :name

      t.timestamps
    end
    create_table :skills_tasks, :id => false do |t|
      t.references :skill
      t.references :task
    end
  end
end
