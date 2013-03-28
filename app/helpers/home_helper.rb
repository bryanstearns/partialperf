module HomeHelper
  def raw_html_helper(i)
    "<li>#{i}</li>".html_safe
  end

  def content_tag_helper(i)
    content_tag(:li) { i }
  end

  def to_series(samples)
    samples.inject([]) do |a, (k, v)|
      a << { name: k, data: v }
      a
    end
  end
end
