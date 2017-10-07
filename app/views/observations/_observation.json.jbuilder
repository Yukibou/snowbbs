json.extract! observation, :id, :observation_at, :created_at, :updated_at
json.url observation_url(observation, format: :json)
