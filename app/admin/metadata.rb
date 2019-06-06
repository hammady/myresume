ActiveAdmin.register Metadata do
  permit_params :key, :value, :standard, :link, :enabled
end
