module AvalancheInfomationsHelper
  def zone_image(zone, rating, trend)
    trend = '0' if rating == :no_rating
    image_tag "#{zone}-#{rating.to_s}-#{trend.to_s}.jpg"
  end
end
