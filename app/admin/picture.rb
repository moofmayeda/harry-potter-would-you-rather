ActiveAdmin.register Picture do
  menu priority: 3
  actions :all, except: [:edit]
  permit_params :image, :title
  config.batch_actions = false
  filter :title

  index as: :grid, columns: 3 do |picture|
    link_to image_tag(picture.image), admin_picture_path(picture)
  end

  show do
    attributes_table do
      row :title
      row :image do |picture|
        image_tag(picture.image)
      end
    end
  end
end