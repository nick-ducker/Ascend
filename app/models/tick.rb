class Tick < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :name, presence: true
  validates :climbtype, presence: true
  validates :grade, presence: true
  validates :style, presence: true
  validates :crag, presence: true
end
