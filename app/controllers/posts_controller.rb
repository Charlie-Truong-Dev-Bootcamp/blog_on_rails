class PostsController < ApplicationController
  before_filter :sign_in, :except => [:index, :show]

  def sign_in
    if session[:user_id].nil?
      redirect_to :sign_in
    end
  end

  def index
    @user = current_user
    @posts = Post.includes(:user,:tags).order("created_at DESC")
    @view = "list"
  end

  def new
    @user = current_user
    @post = Post.new
    @tags = Tag.new
  end

  def create
    @user = current_user
    @post = Post.new(params[:post])
    if @post.save
      @user.posts << @post
      @tags = Tag.add_tags(params[:tag][:name])
      @post.tags << @tags
      redirect_to post_path(@post)
    else
      @tags = Tag.new(params[:tag])
      render template: 'posts/new'   
    end
  end

  def show
    @user = current_user
    @posts = Post.includes(:user,:tags).where(id: params[:post_id])
    @view = "single"
    render template: 'posts/index'
  end

  def edit
    @user = current_user
    @post = Post.find(params[:post_id])
    @tags = Tag.new(name: @post.tags_edit)
    render template: 'posts/new'
  end

  def update
    @user = current_user
    @post = Post.find(params[:post_id])
    @post.attributes = params[:post]
    if @post.save
      @tags = Tag.add_tags(params[:tag][:name])
      @post.tags.clear
      @post.tags << @tags
      redirect_to post_path(@post)
    else
      @tags = Tag.new(params[:tag])
      render template: 'posts/new'   
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to :root
  end
end