class ZoneDetail < ApplicationRecord
  belongs_to :avalanche_problem, inverse_of: :zone_details
  enum zone: { alpine: 1, treeline: 2, below_treeline: 3 }
end
