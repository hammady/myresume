class SkillTask < ActiveRecord::Base
  set_table_name 'skills_tasks'
  belongs_to :skill
  belongs_to :task
  has_one :employer, :through => :task
end
