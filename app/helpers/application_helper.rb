module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: "form-group has-error"
    else
      content_tag :div, capture(&block), class: "form-group"
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = { fenced_code_blocks: true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def up_vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).up_vote?
      "glyphicon glyphicon-chevron-up voted"
    else
      "glyphicon glyphicon-chevron-up"
    end
  end

  def down_vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).down_vote?
      "glyphicon glyphicon-chevron-down voted"
    else
      "glyphicon glyphicon-chevron-down"
    end
  end
end
