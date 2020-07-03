class User < ApplicationRecord
  has_many :ticks
  has_many :workouts
  has_many :favorite_workouts
  has_many :favorite_periods
  has_many :favorite_plans


  has_secure_password

  validates :email, presence: true, uniqueness: true

end
