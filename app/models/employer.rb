class Employer < ActiveRecord::Base
  has_many :tasks
  
  def fromyear
    unless self.from.nil?
      "#{Date::ABBR_MONTHNAMES[self.from.month]} #{self.from.year}"
    else
      "Past"
    end
  end
  
  def toyear
    unless self.to.nil?
      "#{Date::ABBR_MONTHNAMES[self.to.month]} #{self.to.year}"
    else
      "Present"
    end
  end
  
  def position_part(id)
    begin
      self.position.split("/")[id - 1]
    rescue
      nil
    end
  end

  def display_name
    "#{self.name}: #{self.position}"
  end
end
