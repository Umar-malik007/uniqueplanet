class PostsController < ApplicationController

  before_action :confirm_logged_in, :except => [:show, :index]

  def index
    prepare_meta_tags title: "Posts", description: "Find on this page all our free Games, Entertainment, News, Informations, and Knowledge. Hope you will enjoy and get benifits"

    @rec_posts = Post.newest_first
    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 3).newest_first
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 3).newest_first
    end
  end

  def show
    @post = Post.find_by_permalink(params[:id])
    @rec_posts = Post.newest_first

    prepare_meta_tags(title: @post.title,
                      description: @post.content,
                      keywords: @post.keywords,
                      image: @post.image.url(:large),
                      twitter: {card: "summary_large_image"})
  end

  def new
    @post = Post.new()
    @post_count = Post.count + 1
  end

  def edit
    @post = Post.find_by_permalink(params[:id])
    @post_count = Post.count
  end

  def update
    # Find an existing object using form parameters
    @post = Post.find_by_permalink(params[:id])

    # Update the object
    if @post.update_attributes(page_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Post updated successfully."
      redirect_to(:action => 'show', :id => @post)
    else
      # If update fails, redisplay the form so user can fix problems
      @post_count = Post.count
      render('edit')
    end
  end

  def delete
    @post = Post.find_by_permalink(params[:id])
  end

  def destroy
    @post = Post.find_by_permalink(params[:id]).destroy

    flash[:notice] = "Post '#{@post.title}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def create

    # Instantiate a new object using form parameters
    @post = Post.new(page_params)

    # Save the object
    if @post.save!
      # If save succeeds, redirect to the index action
      flash[:notice] = "Post created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @post_count = Post.count + 1
      render('new')
    end

  end

  private

  def page_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:post).permit(:title, :content, :category, :permalink, :position, :visible, :image, :yUrl, :dUrl,:keywords, :created_at)
  end
end
