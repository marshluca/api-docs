module DocsHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:no_links => true, :hard_wrap => true)
    md = Redcarpet::Markdown.new(renderer, :autolink => true, :space_after_headers => true, :fenced_code_blocks => true)
    syntax_highlighter(md.render(text.to_s)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

  def edit_doc_link(project, doc)
    if current_user.master?
      link_to '[编辑]', edit_admin_project_doc_path(project, doc), :style => 'float:right; font-size:14px'
    end
  end

  def manage_parameters_link(project, doc)
    if current_user.master?
      link_to '[参数管理]', admin_project_doc_parameters_path(project, doc), :style => 'float:right; font-size:14px'
    end
  end
end
