class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :school_id, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  scope :admins, -> { where(type: 'Admin') }
  scope :teachers, -> { where(type: 'Teacher') }
  scope :students, -> { where(type: 'Student') }

  def self.types
    %w(Admin Teacher Student)
  end
end

