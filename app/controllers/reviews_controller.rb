class ReviewsController < ApplicationController

  def index
    if params[:search] == ""
    @reviews = []
    elsif params[:search]
    @reviews = Review.all.select{|review| review.reviewname.downcase.include?(params[:search].downcase)}
    else
    @reviews = Review.all
    end
  end

  def new
    @review = Review.new
  end

  def create
      @review = Review.create(review_params)
        return redirect_to controller: 'reviews', action: 'new' unless @review.save
      session[:review_id] = @review.id
      redirect_to review_path(@review)
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      redirect_to @review
    end
  end

  def destroy
    @review = Review.find(params[:id])
  end

private

  def review_params
    params.require(:review).permit(:text, :rating, :image, :user_id, :restaurant_id)
  end

end
