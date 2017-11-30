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

  validates :priority, numericality: { only_integer: true, greater_than: 0 }
  REGISTRABLE_ATTRIBUTES = %i(_destroy id priority problem has_observe has_weak_layer weak_layer potential_size triggering sensitivity spatial terrain memo)
end
