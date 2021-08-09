module ApplicationHelper
  MARKDOWN_COMMENT = '<!--markdown-->'

  def entity_url(id)
    "https://#{ENV.fetch('TP_DOMAIN')}/entity/#{id}"
  end

  # I'm seeing HTML and markdown coming through here...
  def entity_desc(desc_text)
    return desc_text unless desc_text.start_with?(MARKDOWN_COMMENT)
    Kramdown::Document.new(desc_text.sub(MARKDOWN_COMMENT, "")).to_html
  end

  # wtf are these date timestamps TP...
  # expecting strings like: "/Date(1626272272000-0500)/"
  def entity_date(str)
    Time.at(str[/\d{6,}/].to_i / 1000)
  end
end
