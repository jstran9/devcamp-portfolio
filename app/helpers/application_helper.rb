module ApplicationHelper
  def login_helper style = '' # by default just dont have a class for the style.
    # when logged in you are only a User. you are not a User if logged out, but a GuestUser.
    if !current_user.is_a?(GuestUser)
      link_to "logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", user_session_path, class: style)
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    @copyright = EGaddViewTool::Renderer.copyright 'Todd Tran', 'All rights reserved'
  end
end
