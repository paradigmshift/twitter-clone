module ApplicationHelper

  def auto_link(str)
    str = str.gsub(/#(\w+)/, '<a href="/hashtags/\\1">#\1</a>').html_safe
    str = str.gsub(/@(\w+)/, '<a href="\1">@\1</a>')
    str.html_safe
  end

end
