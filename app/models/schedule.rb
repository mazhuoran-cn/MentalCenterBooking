class Schedule < ApplicationRecord
  enum state: [:pending, :active, :finished]
  belongs_to :teacher
  belongs_to :student
  belongs_to :location
  belongs_to :scheduled_student
end
