class Period < ApplicationRecord
  belongs_to :user
  has_many :favorite_periods

  has_many :periods_workouts
  has_many :workouts, through: :periods_workouts

  has_many :plans_timeperiods
  has_many :plans, through: :plans_timeperiods
end
