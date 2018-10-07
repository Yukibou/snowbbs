class AvalancheProblem < ApplicationRecord
  extend Enumerize
  belongs_to :avalanche_infomation, inverse_of: :avalanche_problems
  has_many :zone_details, dependent: :delete_all, inverse_of: :avalanche_problem
  accepts_nested_attributes_for :zone_details


  enumerize :avalanche_type, in: [
      :dry_loose_snow,
      :storm_slab,
      :wind_slab,
      :persistent_slab,
      :deep_persistent_slab,
      :glide_slab,
      :wet_loose_snow,
      :wet_slab
  ]
  # FIXME 不要カラム消すこと
  # enumerize :zone, in: [:alpine, :treeline, :below_treeline]
  enumerize :size, in: ['1', '1.5', '1-2', '1-2.5', '1-3', '1.5-2', '1.5-2.5', '1.5-3', '2', '2-3', '3', '3-4', '4']
  TRIGGERING = [:certain, :very_likely, :likely, :possible, :unlikely]
  enumerize :triggering, in: TRIGGERING
  # enumerize :slope_aspect, in: [:n, :ne, :e, :se, :s, :sw, :w, :nw]

  REGISTRABLE_ATTRIBUTES = [:_destroy, :id, :avalanche_type, :size, :triggering, :comments ,zone_details_attributes: ZoneDetail::REGISTRABLE_ATTRIBUTES]
end
