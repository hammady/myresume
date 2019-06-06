class CreateActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :activities do |t|
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
