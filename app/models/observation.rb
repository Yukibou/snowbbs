class Observation < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :area
  has_many :evaluations, dependent: :delete_all, inverse_of: :observation
  accepts_nested_attributes_for :evaluations

  validates :user, :observation_at, :area, :mountain, :location, presence: true
  validates :elevation_low, :elevation_high, :temperature, numericality: true

  enumerize :sky, in: [:clr, :few, :sct, :bkn, :ovc, :x]
  enumerize :wind_speed, in: [:c, :l, :m, :s, :x]
  enumerize :wind_direction, in: [:n, :ne, :e, :se, :s, :sw, :w, :nw]
  enumerize :precipitation_type, in: [:nil, :r, :s, :rs, :g, :zr]
end
