class DangerRating < ApplicationRecord
  extend Enumerize
  belongs_to :observation, inverse_of: :danger_rating

  enumerize :alpine_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :below_treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :alpine_confidence, in: [:good, :fair, :poor]
  enumerize :treeline_confidence, in: [:good, :fair, :poor]
  enumerize :below_treeline_confidence, in: [:good, :fair, :poor]

  REGISTRABLE_ATTRIBUTES = %i(id alpine_zone treeline_zone below_treeline_zone alpine_comments treeline_comments below_treeline_comments alpine_confidence treeline_confidence below_treeline_confidence)
end
