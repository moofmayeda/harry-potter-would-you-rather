ActiveAdmin.register Pair do
  menu priority: 1
  actions :all, except: [:show]
  permit_params :left_id, :right_id, left_attributes: [:id, :text], right_attributes: [:id, :text]

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

  form do |f|
    inputs "Choices" do
      f.object.build_left if f.object.new_record?
      f.semantic_fields_for :left do |l|
        l.input :text, label: "Left"
      end
      f.object.build_right if f.object.new_record?
      f.semantic_fields_for :right do |r|
        r.input :text, label: "Right"
      end
    end
    actions
  end
end