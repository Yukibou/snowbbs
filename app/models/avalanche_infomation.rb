class AvalancheInfomation < ApplicationRecord
  extend Enumerize
  belongs_to :area
  belongs_to :user
  has_many :avalanche_problems, dependent: :delete_all, inverse_of: :avalanche_infomation
  accepts_nested_attributes_for :avalanche_problems

  enumerize :alpine_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :below_treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  enumerize :alpine_confidence, in: [:good, :fair, :low]
  enumerize :treeline_confidence, in: [:good, :fair, :low]
  enumerize :below_treeline_confidence, in: [:good, :fair, :low]
  enumerize :alpine_trend, in: [:up, :keep, :low]
  enumerize :treeline_trend, in: [:up, :keep, :low]
  enumerize :below_treeline_trend, in: [:up, :keep, :low]

  REGISTRABLE_ATTRIBUTES = %i(id alpine_zone treeline_zone below_treeline_zone alpine_comments treeline_comments below_treeline_comments alpine_confidence treeline_confidence below_treeline_confidence)
end
