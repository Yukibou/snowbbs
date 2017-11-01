CarrierWave.configure do |config|
  # TODO secret.yml から読むようにしたい
  if Rails.env.staging? or Rails.env.production?
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_S3_KEY_ID"],
        aws_secret_access_key: ENV["AWS_S3_SECRET_KEY"],
        region: ENV["AWS_S3_REGION"]
    }
    config.fog_directory = ENV["AWS_S3_BUCKET"]

    config.storage = :fog
    config.fog_public = false
  else
    config.storage = :file
  end
  puts ENV["AWS_S3_REGION"]
end
