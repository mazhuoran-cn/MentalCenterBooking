class Schedule < ApplicationRecord
  enum state: [:pending, :active, :finished]
  belongs_to :teacher
  belongs_to :student
  belongs_to :location
  before_save :set_default_params

  def set_default_params
    self.scheduled_times = 0
    weekday = Location.weekdays[self.location.weekday]
    next_start_time = Time.now.change(hour: Time.now.hour)
    next_start_time += 1.hour until next_start_time.wday == weekday && next_start_time.hour == self.start_time.hour
    self.next_start_time = next_start_time
    end
end
