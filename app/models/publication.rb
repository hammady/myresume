class Publication < ActiveRecord::Base
  attr_accessible :year, :title, :authors, :venue, :enabled
end
