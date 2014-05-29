class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :future_countries
  has_many :past_countries
end