class Evaluation < ApplicationRecord
  extend Enumerize
  belongs_to :observation, inverse_of: :evaluations

  enumerize :problem, in: [
      :dry_loose_snow,
      :storm_slab,
      :wind_slab,
      :persistent_slab,
      :deep_persistent_slab,
      :glide_slab,
      :wet_loose_snow,
      :wet_slab
  ]
  enumerize :triggering, in: [:certain, :very_likely, :likely, :possible, :unlikely]
  enumerize :sensitivity, in: [:unreactive, :stubborn, :reactive, :touchy]
  enumerize :spatial, in: [:isolated, :specific, :widespread]
end
