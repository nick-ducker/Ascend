class User < ApplicationRecord
  has_many :ticks

  has_secure_password

  validates :email, presence: true, uniqueness: true

end
