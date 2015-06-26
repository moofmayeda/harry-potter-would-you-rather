class Choice < ActiveRecord::Base
  has_many :left_assignments, :class_name => 'Pair', :foreign_key => 'left_id'
  has_many :right_assignments, :class_name => 'Pair', :foreign_key => 'right_id'

  def assignments
    self.left_assignments + self.right_assignments
  end

  def count(pair)
    self == pair.left ? pair.left_count : pair.right_count
  end

  def vote(pair)
    if self == pair.left
      pair.left_count += 1
    else
      pair.right_count += 1
    end
    pair.save
  end

  def display_name
    text
  end
end