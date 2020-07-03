class Period < ApplicationRecord
  belongs_to :user
  has_many :periods_workouts
  has_many :workouts, through: :periods_workouts
end
