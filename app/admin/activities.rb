ActiveAdmin.register Activity do
  permit_params :description, :link, :enabled
end
