class Schedule < ApplicationRecord
  enum state: [:pending, :active, :finished]
  belongs_to :teacher
  belongs_to :student
  belongs_to :location
  before_create :calc_next_start_time, :set_scheduled_times
  #before_update :calc_next_start_time
  has_paper_trail

  scope :current, lambda { where("next_start_time > ?", Time.now) }
  scope :over_time, lambda { where("next_start_time < ?", Time.now) }

  rails_admin do
    configure :teacher do
      label "This schedule's teacher: "
    end
    configure :student do
      label "This schedule's student: "
    end
    configure :location do
      label "This schedule's place: "
    end
  end

  def calc_next_start_time
    weekday = Location.weekdays[self.location.weekday]
    next_start_time = DateTime.parse(Time.now.change(hour: Time.now.hour).to_s(:db))
    next_start_time += 1.hour until ( next_start_time.wday == weekday && next_start_time.hour == self.start_time.hour)
    self.next_start_time = next_start_time.to_s(:db)
  end

  def set_scheduled_times
    self.scheduled_times = 0
  end

  def change_scheduled_times
    self.set_scheduled_times += 1
    calc_next_start_time
  end
end
