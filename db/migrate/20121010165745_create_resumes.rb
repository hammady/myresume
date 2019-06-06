class CreateResumes < ActiveRecord::Migration[4.2]
  def change
    create_table :resumes do |t|

      t.timestamps
    end
  end
end
