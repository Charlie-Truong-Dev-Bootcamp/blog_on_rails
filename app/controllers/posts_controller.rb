class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.order("created_at DESC")
    @view = "list"
  end
end