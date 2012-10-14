class AddStandardToMetadata < ActiveRecord::Migration
  def change
    add_column :metadata, :standard, :boolean, :default => false
  end
end
