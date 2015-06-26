ActiveAdmin.register Choice do
  menu priority: 2
  actions :all, except: [:show]
  permit_params :text

  filter :text

	index do
    selectable_column
    column :text
    actions
  end
end