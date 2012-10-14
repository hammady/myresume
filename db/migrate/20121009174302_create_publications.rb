class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :year
      t.string :title
      t.string :authors
      t.string :venue, :limit => 1024

      t.timestamps
    end
  end
end
