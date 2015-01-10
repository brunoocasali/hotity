module ApplicationHelper
  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag(:p,
        model.errors[attribute].first,
        class: 'help-block alert-danger')
    end
  end
end
