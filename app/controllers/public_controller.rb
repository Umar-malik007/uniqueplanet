class PublicController < ApplicationController
  def index

    @rec_posts = Post.order("created_at DESC").limit(3)
    @rec_apps = App.order("created_at DESC").limit(3)

    @combo = @rec_posts + @rec_apps

  end

  def show
    @app = App.where(:permalink => params[:permalink], :visible => true).first
    if @app.nil?
      @app = App.find(params[:id])
    end

    @rec_apps = App.order("created_at DESC")
  end
end
