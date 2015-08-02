module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    
    if !user.image.blank?
       gravator_url = user.image_url
       image_tag(user.image_url, :size => "80x80")
    else
       gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
       image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
  end
end

