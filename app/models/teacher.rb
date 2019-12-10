class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_initialize :set_default_role, :if => :new_record?
  enum role: [:normal, :admin]
  has_many :locations
  has_many :schedules

  def set_default_role
    self.role ||= :normal
  end
end
