module UsersHelper

  def user_html(user)
    html = ''.html_safe
    if user.fbid.present?
      html << raw("<a target='_blank' href='https://www.facebook.com/profile.php?id=") << user.fbid << raw("'>") <<
        user.name << raw("</a>")
    else
      html << user.name || user.login
    end
    html
  end

end
