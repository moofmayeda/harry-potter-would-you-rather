class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :text
    end

    create_table :pairs do |t|
      t.belongs_to :left
      t.belongs_to :right
      t.integer :left_count, default: 0
      t.integer :right_count, default: 0
    end
  end
end
