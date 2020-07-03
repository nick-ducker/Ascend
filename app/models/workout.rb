class Workout < ApplicationRecord
  belongs_to :user
  has_many :favorite_workouts

  has_many :periods_workouts
  has_many :periods, through: :periods_workouts
end
