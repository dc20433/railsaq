class Task < ApplicationRecord
  belongs_to :user
  has_many :notes

  validates :name, presence: true
  validates :priority, numericality: { greater_than: 0 }
  validates :due_date, presence: true
  validate :validates_due_date_in_future


  def validates_due_date_in_future
    if !self.persisted? && due_date.present? && due_date.past?
      errors.add(:due_date, "Can't be in the past")
    end
  end

end
