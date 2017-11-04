class Observation < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :area
  has_many :evaluations, ->{ order(:priority) }, dependent: :delete_all, inverse_of: :observation
  has_one :danger_rating, dependent: :delete, inverse_of: :observation
  accepts_nested_attributes_for :evaluations
  accepts_nested_attributes_for :danger_rating

  mount_uploaders :images, ImageUploader

  validates :user, :observation_at, :area, :mountain, :location, presence: true
  validates :elevation_low, :elevation_high, :temperature_low, :temperature_high, numericality: true, allow_blank: true

  enumerize :sky, in: [:clr, :few, :sct, :bkn, :ovc, :x]
  enumerize :wind_speed, in: [:c, :l, :m, :s, :x]
  enumerize :wind_direction, in: [:n, :ne, :e, :se, :s, :sw, :w, :nw]
  enumerize :precipitation_type, in: [:nil, :r, :s, :rs, :g, :zr]

  REGISTRABLE_ATTRIBUTES = %i(publish observation_at area_id mountain location elevation_low elevation_low_comments elevation_high elevation_high_comments temperature sky sky_comments wind_speed wind_direction wind_comments precipitation_type precipitation_rate precipitation_comments avalanches avalanche_occurred snowpack spin_url comments movie_url)
end
