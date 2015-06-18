class Pair < ActiveRecord::Base
  belongs_to :left, :class_name => 'Choice'
  belongs_to :right, :class_name => 'Choice'
  accepts_nested_attributes_for :left
  accepts_nested_attributes_for :right

  def winning
    if self.left_count == self.right_count
      [self.left, self.right]
    elsif self.left_count > self.right_count
      [self.left]
    else
      [self.right]
    end
  end

  def percent(choice)
    total = (self.left_count + self.right_count).to_f
    self.left == choice ? (self.left_count / total * 100).round(1) : (self.right_count / total * 100).round(1) unless total==0
  end

  def self.dominant(percent)
    self.select {|pair| pair.percent(pair.winning.first) ? pair.percent(pair.winning.first) >= percent : false}
  end

  def self.close(percent)
    upper_bound = 50.0 + percent/2.0
    lower_bound = 50.0 - percent/2.0
    self.select {|pair| pair.percent(pair.left) && pair.percent(pair.right) && pair.percent(pair.left) >= lower_bound && pair.percent(pair.left) <= upper_bound}
  end
end