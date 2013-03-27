module HomeHelper
  def raw_html_helper(i)
    "<li>#{i}</li>".html_safe
  end

  def content_tag_helper(i)
    content_tag(:li) { i }
  end
end
