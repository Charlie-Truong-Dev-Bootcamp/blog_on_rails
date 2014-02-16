class TagsController < ApplicationController
  def posts
    @user = current_user
    tag = Tag.includes(:posts).find(params[:tag_id])
    @view = "list"
    @posts = tag.posts.includes(:user).order("created_at DESC")
    render template: 'posts/index'
  end
end