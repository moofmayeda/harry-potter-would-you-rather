class Pair < ActiveRecord::Base
  belongs_to :left, :class_name => 'Choice'
  belongs_to :right, :class_name => 'Choice'
end