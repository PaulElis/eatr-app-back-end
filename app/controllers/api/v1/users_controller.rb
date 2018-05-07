class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  # def new
  # end

  def create
    @user = User.find_or_create_by(user_params)
    render json: @user
  end

  # def logout
  # end

  def show
    render json: User.find(params[:id])
  end

  # def edit
  # end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: 'Error!'}
    end
  end

  # def destroy
    # @user = User.find(params[:id])
    # @user.destroy
    # render json: {success: "Successfully Destroyed"}
  # end

private

  def user_params
    params.require(:user).permit(:username)
  end

end
