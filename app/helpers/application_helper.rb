module ApplicationHelper
  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def is_active(action)
    params[:action] == action ? "active" : nil
  end

  def flash_class(type)
    case type
      when :alert
        " alert-error"
      when :notice
        " alert-success"

      else
        " alert-success"
    end
  end

  def embed(youtube_url)
    unless youtube_url.nil?
      youtube_id = youtube_url.split("=").last
      return content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    else
      return nil
    end

  end

  def embed(dailymotion_url)
    unless dailymotion_url.nil?
      id = dailymotion_url.split("/").last
      dailymotion_id = id.split('_').first
      return content_tag(:iframe, nil, src: "//www.dailymotion.com/embed/video/#{dailymotion_id}")
    else
      return nil
    end

  end


  def signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end



end
