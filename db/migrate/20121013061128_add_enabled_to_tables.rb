class AddEnabledToTables < ActiveRecord::Migration[4.2]
  def change
    add_column :employers, :enabled, :boolean, :default => :t
    add_column :tasks, :enabled, :boolean, :default => :t
    add_column :activities, :enabled, :boolean, :default => :t
    add_column :educations, :enabled, :boolean, :default => :t
    add_column :publications, :enabled, :boolean, :default => :t
    add_column :skills, :enabled, :boolean, :default => :t
    add_column :metadata, :enabled, :boolean, :default => :t
  end
end
