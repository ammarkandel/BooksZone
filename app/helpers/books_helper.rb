module BooksHelper
  def book_change_status(book)
    out = ''
    Book::STATUS.each do |status|
      out << "<li>#{link_to(status, change_status_book_path(book, status: status), method: :patch)}</li>"
    end
    out.html_safe
  end

  def book_change_privacy(book)
    out = ''
    Book::PRIVACY.each do |privacy|
      out << "<li>#{link_to(privacy, change_privacy_book_path(book, privacy: privacy), method: :patch)}</li>"
    end
    out.html_safe
  end

  def nav_links_access
    out = ''
    return unless current_user
    out << '<li>profile</li>'
    out << '<li>new book</li>'
    out << '<li>logout</li>'
    out.html_safe
  end
end
