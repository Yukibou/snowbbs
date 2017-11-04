module ObservationsHelper
  def with_comments(value, comments)
    "#{value}(#{comments})"
  end

  def with_label(label, value)
    "#{label}：#{value}"
  end
end
