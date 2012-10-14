class AddLinkToMetadata < ActiveRecord::Migration
  def change
    add_column :metadata, :link, :string
  end
end
