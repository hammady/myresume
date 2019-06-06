ActiveAdmin.register Education do
  permit_params :year, :certificate, :institute, :description, :enabled
end
