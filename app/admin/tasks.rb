ActiveAdmin.register Task do
  form do |f|
    f.inputs do
      f.input :employer, :label => "Employer (leave blank for freelancing)"
      f.input :opensource_type, :as => :select, :collection => %w(main contrib), :label => "Opensource type (leave blank for non-opensource)"
      f.input :name
      f.input :description, :as => :text
      f.input :link
      f.input :enabled
    end
    f.buttons
  end
end
