class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :future_countries
  has_many :dream_list, through: :future_countries, source: :country
  has_many :past_countries
  has_many :been_there, through: :past_countries, source: :country
end