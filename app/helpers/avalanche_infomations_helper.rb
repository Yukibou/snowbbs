module AvalancheInfomationsHelper
  def zone_prefix(zone_name)
    case zone_name
    when 'alpine'
      'alp'
    when 'treeline'
      'tl'
    when 'below_treeline'
      'btl'
    end
  end
end
