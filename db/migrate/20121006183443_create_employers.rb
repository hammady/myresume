class CreateEmployers < ActiveRecord::Migration
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
