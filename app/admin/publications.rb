ActiveAdmin.register Publication do
  permit_params :year, :title, :authors, :venue, :enabled
end
