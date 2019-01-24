class Location < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates_presence_of :name, :latitude, :longitude
end
