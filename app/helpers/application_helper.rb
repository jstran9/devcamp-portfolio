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

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please free free to #{ link_to 'contact me',
            contact_path} if you'd like to work together."
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    @copyright = EGaddViewTool::Renderer.copyright 'Todd Tran', 'All rights reserved'
  end

  def nav_items
     [
         {
             url: root_path,
             title: 'Home'
         },
         {
             url: about_me_path,
             title: 'About Me'
         },
         {
             url: contact_path,
             title: 'Contact'
         },
         {
             url: blogs_path,
             title: 'Blog'
         },
         {
             url: portfolios_path,
             title: 'Portfolio'
         },
         {
             url: tech_news_path,
             title: 'Tech News'
         }
     ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |nav_item|
      nav_links << "<#{tag_type}><a href='#{nav_item[:url]}' class='#{style} #{active? nav_item[:url]}'>
            #{nav_item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    # creates message
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Todd T's Portfolio", sticky: false)
  end


end
