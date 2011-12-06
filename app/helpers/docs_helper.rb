module DocsHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:no_links => true, :hard_wrap => true)
    md = Redcarpet::Markdown.new(renderer, :autolink => true, :space_after_headers => true)
    syntax_highlighter(md.render(text.to_s)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
