class DangerRating < ApplicationRecord
  extend Enumerize
  belongs_to :observation, inverse_of: :danger_rating

  enumerize :alpine_zone, in: [:extreme, :high, :considerable, :moderate, :low]
  enumerize :treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low]
  enumerize :below_treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low]
  enumerize :confidence, in: [:good, :fair, :poor]

  REGISTRABLE_ATTRIBUTES = %i(id alpine_zone treeline_zone below_treeline_zone confidence comments)
end
