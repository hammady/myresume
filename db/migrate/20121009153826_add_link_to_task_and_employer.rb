class AddLinkToTaskAndEmployer < ActiveRecord::Migration
  def change
    add_column :tasks, :link, :string
    add_column :employers, :link, :string
  end
end
