class AvalancheInfomation < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :avalanche_area
  has_many :observations
  has_many :avalanche_problems, dependent: :delete_all, inverse_of: :avalanche_infomation
  accepts_nested_attributes_for :avalanche_problems, allow_destroy: true

  enumerize :alpine_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  validates :alpine_zone, presence: true
  enumerize :treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  validates :treeline_zone, presence: true
  enumerize :below_treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  validates :below_treeline_zone, presence: true
  enumerize :alpine_confidence, in: [:good, :fair, :low]
  enumerize :treeline_confidence, in: [:good, :fair, :low]
  enumerize :below_treeline_confidence, in: [:good, :fair, :low]
  enumerize :alpine_trend, in: [:up, :stay, :down]
  validates :alpine_trend, presence: true
  enumerize :treeline_trend, in: [:up, :stay, :down]
  validates :treeline_trend, presence: true
  enumerize :below_treeline_trend, in: [:up, :stay, :down]
  validates :below_treeline_trend, presence: true

  REGISTRABLE_ATTRIBUTES = %i(id alpine_zone treeline_zone below_treeline_zone alpine_comments treeline_comments below_treeline_comments alpine_confidence treeline_confidence below_treeline_confidence)

  scope :sort_order, -> { order(announced_at: :desc) }

  def title_name
    announced_date = announced_at.strftime("%y%m%d")
    "#{announced_date} #{self.avalanche_area.name}"
  end
end
