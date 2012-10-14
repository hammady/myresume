ActiveAdmin.register Employer do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :from, :as => :datepicker
      f.input :to, :as => :datepicker
      f.input :position
      f.input :country
      f.input :link
      f.input :enabled
    end
    f.buttons
  end
end
