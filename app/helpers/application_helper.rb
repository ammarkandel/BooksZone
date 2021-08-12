module ApplicationHelper
  def nav_links_access
    out = ''
    return unless current_user

    out << "<li>#{link_to('Profile', user_profile_path)}</li>"
    out << "<li>#{link_to('New Book', new_book_path)}</li>"
    out << "<li>#{link_to 'Logout', destroy_user_session_path, method: :delete}</li>"
    out.html_safe
  end

  def nav_links_auth
    out = ''
    return unless !current_user

    out << "<li>#{link_to('Login', new_user_session_path)}</li>"
    out << "<li>#{link_to('Signup', new_user_registration_path)}</li>"
    out.html_safe
  end
end
