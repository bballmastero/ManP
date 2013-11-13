class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    if current_user
      redirect_to manfriends_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Thank you for signing up to Man Points'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @relationship = Relationship.where(
        follower_id: current_user.id,
        followed_id: @user.id
    ).first_or_initialize if current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def buddies
    if current_user
      @post = Post.new
      manfriends_ids = current_user.followeds.map(&:id).push(current_user.id)
      @post = Ribbit.find_all_by_user_id manfriends_ids
    else
      redirect_to root_url
    end
  end

end