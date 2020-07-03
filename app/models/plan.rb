class Plan < ApplicationRecord
  belongs_to :user

  has_many :plans_timeperiods
  has_many :periods, through: :plans_timeperiods
end
