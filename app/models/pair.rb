class Pair < ActiveRecord::Base
  belongs_to :left, :class_name => 'Choice'
  belongs_to :right, :class_name => 'Choice'
  accepts_nested_attributes_for :left
  accepts_nested_attributes_for :right
end