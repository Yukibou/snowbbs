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
end
