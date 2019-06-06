class AddOpensourceTypeToTask < ActiveRecord::Migration[4.2]
  def change
    add_column :tasks, :opensource_type, :string
    add_index :tasks, :opensource_type
  end
end
