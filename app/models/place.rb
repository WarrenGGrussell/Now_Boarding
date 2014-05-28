class Place < ActiveRecord::Base
  validates :country, presence: true
  validates :visited, presence: true
  belongs_to :user

end