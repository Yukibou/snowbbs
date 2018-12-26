class AvalancheArea < ApplicationRecord
  has_many :avalanche_infomations
  validates :name, presence: true
end
