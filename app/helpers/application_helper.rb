module ApplicationHelper
  def markdown(text)
    return "" if text.blank?

    renderer = Redcarpet::Render::HTML.new(
      hard_wrap: true,
      link_attributes: { target: "_blank", rel: "noopener noreferrer" }
    )
    options = {
      autolink: true,
      fenced_code_blocks: true,
      tables: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      no_intra_emphasis: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  # MarkdownからHTMLタグを取り除き、プレーンテキストを抽出する（一覧表示用）
  def markdown_to_plain_text(text)
    return "" if text.blank?
    # Markdownを一度HTMLにしてからタグを除去し、連続する空白・改行を1つのスペースにまとめる
    strip_tags(markdown(text)).gsub(/\s+/, " ").strip
  end
end
