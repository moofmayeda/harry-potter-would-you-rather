class AddPicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :image
    end
  end
end
