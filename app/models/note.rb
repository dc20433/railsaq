class Note < ApplicationRecord
  belongs_to :task
  validates :title, presence: true
end