class AddLinkToMetadata < ActiveRecord::Migration[4.2]
  def change
    add_column :metadata, :link, :string
  end
end
