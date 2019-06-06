class CreateEducations < ActiveRecord::Migration[4.2]
  def change
    create_table :educations do |t|
      t.integer :year
      t.string :certificate
      t.string :institute
      t.string :description, :limit => 1024

      t.timestamps
    end
  end
end
