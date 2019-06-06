class IncreaseTaskDescriptionLength < ActiveRecord::Migration[4.2]
  def change
    change_column :tasks, :description, :string, :limit => 1024
  end
end
