module ApplicationHelper
	#herlper for obtain the gravatar image for user
	def avatar_url(user)  
    	gravatar_id = Digest::MD5::hexdigest(user.email).downcase  
    	"http://gravatar.com/avatar/#{gravatar_id}.png"  
  end

  #helper for add clases in home to pictures of washers
  def next_disher_style(index)
    case index
    when 3
      'img-rounded tomorrow-washer falling-3'
    when 4
      'img-rounded today-washer falling-2'
    else
      "img-rounded next-washer falling-next-#{index}"
    end
  end

  def style_is_admin(is_admin)
    if is_admin == true
      '<tr class= "success">'
    else
      '<tr>'
    end
  end
end
