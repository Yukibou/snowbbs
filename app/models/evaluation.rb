class Evaluation < ApplicationRecord
  belongs_to :observation, inverse_of: :evaluations
end
