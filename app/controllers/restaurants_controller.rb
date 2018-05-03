class RestaurantsController < ApplicationController

  def index
    if params[:search] == ""
      # @restaurants = []
      render json: []
    elsif params[:search]
      # @restaurants = Restaurant.all.select{|restaurant| restaurant.restaurantname.downcase.include?(params[:search].downcase)}
      render json: Restaurant.all.select{|restaurant| restaurant.restaurantname.downcase.include?(params[:search].downcase)}
    else
      @restaurants = Restaurant.all
    end

    # render json: Restaurant.all
  end

  # def new
  #   @restaurant = Restaurant.new
  # end

  def create
      @restaurant = Restaurant.create(restaurant_params)
        return redirect_to controller: 'restaurants', action: 'new' unless @restaurant.save
      session[:restaurant_id] = @restaurant.id
      redirect_to restaurant_path(@restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # def edit
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      redirect_to @restaurant
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :average_cost, :image)
  end

end
