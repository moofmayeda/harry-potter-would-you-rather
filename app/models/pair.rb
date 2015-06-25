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

  def losing
    if self.winning.size == 2
      self.right
    else
      self.winning.first == self.left ? self.right : self.left
    end
  end

  def self.search(search)
    if search
      choices = Choice.where('UPPER(choices.text) LIKE UPPER(?)', "%#{search}%").pluck(:id)
      self.joins('LEFT OUTER JOIN choices aliasedchoices ON aliasedchoices.id = pairs.left_id LEFT OUTER JOIN choices on choices.id = pairs.right_id').where('aliasedchoices.id IN (?) OR choices.id IN (?)', choices, choices)
    else
      where(nil)
    end
  end

  def greater_percent
    [self.percent(left), self.percent(right)].max || 0
  end

  def lesser_percent
    [self.percent(left), self.percent(right)].min || 0
  end

  def greater_count
    [left_count, right_count].max
  end

  def lesser_count
    [left_count, right_count].min
  end
end