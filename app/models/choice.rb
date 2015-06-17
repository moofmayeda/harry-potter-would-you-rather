class Choice < ActiveRecord::Base
  has_many :left_assignments, :class_name => 'Pair', :foreign_key => 'left_id'
  has_many :right_assignments, :class_name => 'Pair', :foreign_key => 'right_id'

  def assignments
    self.left_assignments + self.right_assignments
  end
end