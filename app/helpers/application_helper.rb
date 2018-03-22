module ApplicationHelper
  def generate_title(title = "")
    base_title = "Portfolio"
    title.blank? ? base_title : "#{title} | #{base_title}"
  end

  def user_log_status css_class
    if current_user.is_a? GuestUser
      link_to("Login", new_user_session_path, class: css_class) +
      link_to("Register", new_user_registration_path, class: css_class)
    else
      link_to("Account", edit_user_registration_path, class: css_class) +
      link_to("Logout", destroy_user_session_path, method: :delete, class: css_class)
    end
  end

  def source_helper
    content = "Thank for visiting me from #{session[:source]}"
    insert_content_to_tag(:div, content) if session[:source]
  end

  def shorten_text content, length
    truncate content, length: length
  end

  def time_ago time
    time_ago_in_words(time) + " ago"
  end

  def copyright name, message
      "&copy; #{Time.now.year} | <b>#{name}</b> #{message}".html_safe
  end

  def flash_type type
    case type
    when :notice then "alert-info"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end
end
