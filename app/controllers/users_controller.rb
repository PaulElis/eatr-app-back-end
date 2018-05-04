class UsersController < ApplicationController

  def index
    # if params[:search] == ""
    #   @users = []
    # elsif params[:search]
    #   @users = User.all.select{|user| user.username.downcase.include?(params[:search].downcase)}
    # else
    #   @users = User.all
    # end
    render json: User.all
  end

  def new
    # @user = User.new
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def logout
  end

  def show
    # @user = User.find(params[:id])
    render json: User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: 'Error!'}
    end
  end

  def destroy
    # @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:username, :favorites, :image)
  end

end
