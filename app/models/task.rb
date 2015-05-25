class Task < ActiveRecord::Base
  attr_accessible :name, :description, :employer_id, :link, :enabled
  attr_accessible :opensource_type 
  
  belongs_to :employer
  has_and_belongs_to_many :skills
end
