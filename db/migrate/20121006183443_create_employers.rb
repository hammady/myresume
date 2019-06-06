class CreateEmployers < ActiveRecord::Migration[4.2]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :position
      t.date :from
      t.date :to
      t.string :country

      t.timestamps
    end
  end
end
