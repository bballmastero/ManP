class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      redirect_to current_user
    else
      flash[:error] = 'Problem!'
      redirect_to current_user
    end
  end

  def index
    @posts = Post.all include: :user
    @post = Post.new
  end
end