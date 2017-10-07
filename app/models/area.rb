class Area < ApplicationRecord
  has_many :observations
  validates :name, presence: true
end
