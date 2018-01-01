class DangerRating < ApplicationRecord
  extend Enumerize
  belongs_to :observation, inverse_of: :danger_rating

  enumerize :alpine_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :below_treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :alpine_confidence, in: [:high, :moderate, :low]
  enumerize :treeline_confidence, in: [:high, :moderate, :low]
  enumerize :below_treeline_confidence, in: [:high, :moderate, :low]

  REGISTRABLE_ATTRIBUTES = %i(id alpine_zone treeline_zone below_treeline_zone alpine_comments treeline_comments below_treeline_comments alpine_confidence treeline_confidence below_treeline_confidence)

  def convert_confidence
    self.alpine_confidence = :high if self.alpine_confidence == :good
    self.alpine_confidence = :moderate if self.alpine_confidence == :fair
    self.treeline_confidence = :high if self.treeline_confidence == :good
    self.treeline_confidence = :moderate if self.treeline_confidence == :fair
    self.below_treeline_confidence = :high if self.below_treeline_confidence == :good
    self.below_treeline_confidence = :moderate if self.below_treeline_confidence == :fair
    save!
  end
end
