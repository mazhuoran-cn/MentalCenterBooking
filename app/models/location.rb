class Location < ApplicationRecord
  # TODO: Check time conflict.
  enum place: [:中关村, :玉泉路, :奥运村, :岳阳路]
  enum weekday: [:Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday, :Sunday]
  belongs_to :teacher
  has_many :schedules
end
