class AppsController < ApplicationController

  before_action :confirm_logged_in, :except => [:show, :index]

  def index
    prepare_meta_tags title: "Applications", description: "Find on this page all our free Games, Entertainment, News, Informations, and Knowledge. Hope you will enjoy and get benifits"
    @rec_apps = App.newest_first.limit(5)
    if params[:search]
      @apps = App.search(params[:search]).paginate(:page => params[:page], :per_page => 3).newest_first
    else
      @apps = App.paginate(:page => params[:page], :per_page => 3).newest_first
    end
  end

  def show
    @app = App.find_by_permalink(params[:id])
    @rec_apps = App.newest_first

    prepare_meta_tags(title: @app.title,
                      description: @app.content,
                      keywords: @app.keywords,
                      image: @app.image.url(:large),
                      twitter: {card: "summary_large_image"})

  end

  def new
    @app = App.new()
    @app_count = App.count + 1
  end

  def edit
    @app = App.find_by_permalink(params[:id])
    @app_count = App.count
  end

  def update
    # Find an existing object using form parameters
    @app = App.find_by_permalink(params[:id])

    # Update the object
    if @app.update_attributes(page_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "App updated successfully."
      redirect_to(:action => 'show', :id => @app)
    else
      # If update fails, redisplay the form so user can fix problems
      @app_count = App.count
      render('edit')
    end
  end

  def delete
    @app = App.find_by_permalink(params[:id])
  end

  def destroy
    @app = App.find_by_permalink(params[:id]).destroy
    flash[:notice] = "App '#{@app.title}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def create

    # Instantiate a new object using form parameters
    @app = App.new(page_params)

    # Save the object
    if @app.save!
      # If save succeeds, redirect to the index action
      flash[:notice] = "App created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @app_count = App.count + 1
      render('new')
    end

  end

  private

  def page_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:app).permit(:title, :content, :category, :permalink, :position, :visible, :image, :yUrl,:dUrl, :down_link, :keywords, :created_at)
  end
end
