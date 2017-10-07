class Observation < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :area
  validates :user, :observation_at, :area, :mountain, :location, presence: true
  validates :elevation_low, :elevation_high, :temperature, numericality: true

  enumerize :sky, in: [:clr, :few, :sct, :bkn, :ovc, :x]
end
