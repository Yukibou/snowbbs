class ZoneDetail < ApplicationRecord
  belongs_to :avalanche_problem, inverse_of: :zone_details

  enum zone: { alpine: 1, treeline: 2, below_treeline: 3 }
  enum aspect_n_power: { n_strong: 2, n_weak: 1 }
  enum aspect_ne_power: { ne_strong: 2, ne_weak: 1 }
  enum aspect_e_power: { e_strong: 2, e_weak: 1 }
  enum aspect_se_power: { se_strong: 2, se_weak: 1 }
  enum aspect_s_power: { s_strong: 2, s_weak: 1 }
  enum aspect_sw_power: { sw_strong: 2, sw_weak: 1 }
  enum aspect_w_power: { w_strong: 2, w_weak: 1 }
  enum aspect_nw_power: { nw_strong: 2, nw_weak: 1 }

  ASPECTS = %i(n ne e se s sw w nw)
  REGISTRABLE_ATTRIBUTES = %i(_destroy id zone avalanche_problem_id zone aspect_n aspect_n_power aspect_ne aspect_ne_power aspect_e aspect_e_power aspect_se aspect_se_power aspect_s aspect_s_power aspect_sw aspect_sw_power aspect_w aspect_w_power aspect_nw aspect_nw_power )
end
