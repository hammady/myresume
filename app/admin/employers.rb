ActiveAdmin.register Employer do
  permit_params :name, :from, :to, :position, :country, :link, :enabled

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :from, :as => :datepicker
      f.input :to, :as => :datepicker
      f.input :position
      f.input :country, :as => :string
      f.input :link
      f.input :enabled
    end
    f.actions
  end
end
