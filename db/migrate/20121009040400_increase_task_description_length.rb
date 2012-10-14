class IncreaseTaskDescriptionLength < ActiveRecord::Migration
  def change
    change_column :tasks, :description, :string, :limit => 1024
  end
end
