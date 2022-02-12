class ReviewsController < ApplicationController
  before_action :set_pet
  before_action :authenticate_user!

  def index
    @reviews = @pet.reviews
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @review = Review.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @review = Review.new(review_params)
    @review.pet = @pet
    @review.user = current_user
    if @review.save
      redirect_to pet_path(@pet)
    else
      @offer = Offer.new
      render 'pets/show'
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
