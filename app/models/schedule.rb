class Schedule < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :location
end
