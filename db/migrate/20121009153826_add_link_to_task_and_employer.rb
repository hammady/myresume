class AddLinkToTaskAndEmployer < ActiveRecord::Migration[4.2]
  def change
    add_column :tasks, :link, :string
    add_column :employers, :link, :string
  end
end
