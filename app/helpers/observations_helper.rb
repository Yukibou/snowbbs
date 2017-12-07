module ObservationsHelper
  def with_comments(value, comments)
    "#{value}(#{comments})"
  end

  def with_label(label, value)
    "#{label}：#{value}"
  end

  def to_yes_no(value)
    value ? 'Yes' : 'No'
  end

  def to_publish_value(value)
    value ? '公開' : '非公開'
  end

  def temp_with_comments(value, hrs, elev)
    if value.present?
      hrs_string = hrs.present? ? "#{hrs}hrs" : ''
      elev_string = elev.present? ? "#{elev}m" : ''
      "#{value}(#{hrs_string} / #{elev_string})"
    end
  end

  def spin_urls(spin_nos)
    if spin_nos.present?
      links = spin_nos.split(',').map do |no|
        link_to(spin_url(no), target: '_blank') do
          content_tag(:i, nil, class: 'fa fa-external-link').html_safe + " Yes(#{no})"
        end
      end
      safe_join(links, '<br>'.html_safe)
    end
  end

  def spin_url(no)
    "http://spin.nadare.jp/profiles/#{no}"
  end
end
