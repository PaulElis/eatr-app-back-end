class UsersController < ApplicationController

  def index
    if params[:search] == ""
      @users = []
    elsif params[:search]
      @users = User.all.select{|user| user.username.downcase.include?(params[:search].downcase)}
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
      @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def logout
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:username, :favorites, :image)
  end

end
