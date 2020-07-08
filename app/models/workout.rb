class Workout < ApplicationRecord
  belongs_to :user
  has_many :favorite_workouts

  has_many :periods_workouts
  has_many :periods, through: :periods_workouts

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :shared, presence: true
  
end
