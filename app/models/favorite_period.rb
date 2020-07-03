class FavoritePeriod < ApplicationRecord
  belongs_to :user
  belongs_to :period
end
