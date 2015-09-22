class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"


  def prepare_meta_tags(options={})

    site        = "UniquePlanet"
    title       = [controller_name, action_name].join(" ")
    description = "I developed this website to give the people free Games, Entertainment, News, Informations, and Knowledge. Hope you will enjoy and get benifits."
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults

    defaults = {
        site:        site,
        title:       title,
        image:       image,
        description: description,
        keywords:    %w[web software development mobile applications news entertainment information games],
        twitter:     {site_name: site,
                      site: '@uniqueplanet',
                      card: 'summary',
                      description: description,
                      image: image},
        og:          {url: current_url,
                      site_name: site,
                      title: title,
                      image: image,
                      description: description,
                      type: 'website'}
    }


    options.reverse_merge!(defaults)


    set_meta_tags options

  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return  false
    else
      return true
    end
  end


end
