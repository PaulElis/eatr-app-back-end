class Api::V1::BusinessesController < ApplicationController

  def index
    render json: Business.all
  end

  # def new
  # end

  # def create
    # render json: Business.find_or_create_by(@business_id)
  # end

  def show
    @business = Business.find(params[:id])
    render json: {business: @business, reviews: @business.reviews}
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
    # @business = Business.find(params[:id])
  # end

private

  def business_params
    params.require(:business).permit(:yelp_id, :name, :cuisine, :address, :price, :image, :url, :rating)
  end

end
