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
end
