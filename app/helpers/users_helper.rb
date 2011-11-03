module UsersHelper
  def user_avatar_tag(user, size = :normal, opts = {})
    link = opts[:link] || true
    width = 48
    case size
    when :normal
      width = 48
    when :small
      width = 16
    when :large
      width = 64
    else
      width = size
    end

    hash = (user.blank? or user.email.blank?) ? Digest::MD5.hexdigest("") : Digest::MD5.hexdigest(user.email)
    return "<img src=\"http://www.gravatar.com/avatar/#{hash}?s=#{width}\" />" if user.blank?

    img_src = "http://www.gravatar.com/avatar/#{hash}?s=#{width}"
    img = "<img src=\"#{img_src}\" />"
    if link
      raw("<a href=\"#{user_path(user.name)}\" title=\"#{user.name}\">#{img}</a>")
    else
      raw img
    end
  end
end
