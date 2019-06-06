class AddStandardToMetadata < ActiveRecord::Migration[4.2]
  def change
    add_column :metadata, :standard, :boolean, :default => false
  end
end
