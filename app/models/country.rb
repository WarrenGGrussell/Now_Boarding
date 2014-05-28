class Country < ActiveRecord::Base
  has_many :users
  has_many :place_future
  has_many :place_past
end