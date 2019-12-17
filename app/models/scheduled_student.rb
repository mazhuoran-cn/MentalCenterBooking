class ScheduledStudent < ApplicationRecord
  enum state: [:pending, :active, :finished]
  #belongs_to :student
  has_many :schedules, dependent: :destroy
end
