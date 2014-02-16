class TagsController < ApplicationController
  def posts
    @user = current_user
    tag = Tag.find(params[:tag_id])
    @view = "list"
    @posts = tag.posts.order("created_at DESC")
    render template: 'posts/index'
  end
end