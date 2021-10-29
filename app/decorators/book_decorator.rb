class BookDecorator < ApplicationDecorator
  delegate_all

  def delete_link
    h.content_tag :li do
      h.link_to 'Delete', h.book_path(object), method: :delete, data: {confirm: 'Are you sure?'}, class: 'delete'
    end
  end

  def edit_link
    h.content_tag :li do
      h.link_to 'Edit', h.edit_book_path
    end
  end

  def book_actions
     result = ''

     result << edit_link
     result << delete_link
     result.html_safe if h.current_user == object.user_id
  end

  def change_privacy_link(privacy)
    h.content_tag :li do
      h.link_to privacy, h.change_privacy_book_path(object, privacy: privacy), method: :patch, remote: true
    end
  end

  def change_status_link(status)
    h.content_tag :li do
      h.link_to status, h.change_status_book_path(object, status: status), method: :patch, remote: true
    end
  end

  def book_privacy
     result = ''

     Book::PRIVACY.each do |privacy|
       result << change_privacy_link(privacy)
     end
     result.html_safe if h.current_user.id == object.user_id
  end

  def book_status
     result = ''

     Book::STATUS.each do |status|
       result << change_status_link(status)
     end
     result.html_safe if h.current_user.id == object.user_id
  end
end
