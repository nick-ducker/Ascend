class PlansTimeperiod < ApplicationRecord
  belongs_to :period
  belongs_to :plan
end
