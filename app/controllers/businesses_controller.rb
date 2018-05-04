class BusinessesController < ApplicationController

  def index
    # if params[:search] == ""
    #   # @businesses = []
    #   # render json: []
    # elsif params[:search]
    #   # @businesses = Business.all.select{|business| business.businessname.downcase.include?(params[:search].downcase)}
    #   # render json: @businesses.select{|business| business.businessname.downcase.include?(params[:search].downcase)}
    #   # render json: Business.all
    #   render json:  Business.get_nyc_businesses
    # else
    #   # @businesses = Business.all
    #   render json: @businesses
    # end
    # render json: Business.all

    render json: Business.all
  end

  # def new
  #   @business = Business.new
  # end

  def create
    # @business = Business.create(business_params)
    #   return redirect_to controller: 'businesses', action: 'new' unless @business.save
    # session[:business_id] = @business.id
    # redirect_to business_path(@business)

    # render json: Business.find_or_create_by(@business_id)
  end

  def show
    render json: Business.find(params[:id])
  end

  # def edit
  #   @business = Business.find(params[:id])
  # end

  def update
    # @business = Business.find(params[:id])
    # if @business.update(business_params)
    #   redirect_to @business
    # else
    #   redirect_to @business
    # end
  end

  def destroy
    # @business = Business.find(params[:id])
  end

private

  def business_params
    params.require(:business).permit(:name, :cuisine, :address, :price, :image, :url, :rating, :yelp_id)
  end

end
