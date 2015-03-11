class Talk < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(date: :desc) }
  validates :user_id, presence: true
  validates :topics, presence: true
  validates :date, presence: true
  validate :tuesday_or_thursday
  validate :already_five

  def talk_completed
    if self.date.present? && self.date < Date.today
      self.update_attributes(completed: true)
    else
      false
    end
  end

  def tuesday_or_thursday
    if self.date.present?
      unless self.date.wday == 2 || self.date.wday == 4
        self.errors[:base] << "Please select Tuesday or Thursday"
      end
    end
  end

  def already_five
    if Talk.where(date: self.date).length >= 5
      self.errors[:base] << "There are already 5 lightning talks for that day."
    end
  end
end
