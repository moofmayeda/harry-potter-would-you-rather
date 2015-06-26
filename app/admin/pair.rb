ActiveAdmin.register Pair do
  menu priority: 1
  actions :all, except: [:show, :edit]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do
		selectable_column
		column "Left Choice" do |pair|
			pair.left.text
		end
		column "Left Count" do |pair|
			pair.left_count
		end
		column "Right Count" do |pair|
			pair.right_count
		end
		column "Right Choice" do |pair|
			pair.right.text
		end
    actions
	end
end
