ActiveAdmin.register Task do
  permit_params :name, :description, :employer_id, :link, :enabled, :opensource_type
  form do |f|
    f.inputs do
      f.input :employer, :label => "Employer (leave blank for freelancing)"
      f.input :opensource_type, :as => :select, :collection => %w(main contrib), :label => "Opensource type (leave blank for non-opensource)"
      f.input :name
      f.input :description, :as => :text
      f.input :link
      f.input :enabled
    end
    f.actions
  end
end
