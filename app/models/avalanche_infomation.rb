class AvalancheInfomation < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :area
  has_many :observations
  has_many :avalanche_problems, dependent: :delete_all, inverse_of: :avalanche_infomation
  accepts_nested_attributes_for :avalanche_problems

  enumerize :alpine_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  validates :alpine_zone, presence: true
  enumerize :treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  validates :treeline_zone, presence: true
  enumerize :below_treeline_zone, in: [:extreme, :high, :considerable, :moderate, :low, :no_rating]
  validates :below_treeline_zone, presence: true
  enumerize :alpine_confidence, in: [:good, :fair, :low]
  validates :alpine_confidence, presence: true
  enumerize :treeline_confidence, in: [:good, :fair, :low]
  validates :treeline_confidence, presence: true
  enumerize :below_treeline_confidence, in: [:good, :fair, :low]
  validates :below_treeline_confidence, presence: true
  enumerize :alpine_trend, in: [:up, :stay, :down]
  validates :alpine_trend, presence: true
  enumerize :treeline_trend, in: [:up, :stay, :down]
  validates :treeline_trend, presence: true
  enumerize :below_treeline_trend, in: [:up, :stay, :down]
  validates :below_treeline_trend, presence: true
  # enumerize :area_name, in: ['白馬','神楽谷川武尊','妙高','立山']
  # validates :area_name, presence: true

  REGISTRABLE_ATTRIBUTES = %i(id alpine_zone treeline_zone below_treeline_zone alpine_comments treeline_comments below_treeline_comments alpine_confidence treeline_confidence below_treeline_confidence)

  scope :sort_order, -> { order(announced_at: :desc) }

  def title_name
    announced_date = announced_at.strftime("%y%m%d")
    "#{announced_date} #{self.area.name}"
  end
end
