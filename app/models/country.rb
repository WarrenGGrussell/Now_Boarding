class Country < ActiveRecord::Base
  # has_many :users
  has_many :future_countries
  has_many :past_countries
  has_many :users_with_future_countries, through: future_countries, class_name: "User", foreign_key: "user_id"
  has_many :users_with_past_countries, through: past_countries, class_name: "User", foreign_key: "user_id"
end