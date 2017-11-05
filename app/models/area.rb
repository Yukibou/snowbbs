class Area < ApplicationRecord
  has_many :observations
  validates :name, presence: true

  scope :public_area, -> { where(public: true) }
  scope :sort_order, -> { order(:id) }
end
