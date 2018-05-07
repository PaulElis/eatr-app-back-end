class Api::V1::ReviewsController < ApplicationController

  def index
    render json: Review.all
  end

  # def new
  # end

  def create
    @review = Review.create(review_params)
    render json: @review
  end

  # def logout
  # end

  def show
    render json: Review.find(params[:id])
  end

  # def edit
  # end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render json: @review
    else
      render json: {error: 'Error!'}
    end
  end

  # def destroy
    # @review = Review.find(params[:id])
    # @review.destroy
    # render json: {success: "Successfully Destroyed"}
  # end

private

  def review_params
    params.require(:review).permit(:text, :rating, :user_id, :restaurant_id)
  end

end
