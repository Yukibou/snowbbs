class Area < ApplicationRecord
  has_many :observations
  has_many :avalanche_infomations
  validates :name, presence: true

  scope :public_area, -> { where(public: true) }
  scope :sort_order, -> { order(:id) }
end
