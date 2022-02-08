class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pet = Pet.find(params[:pet_id])
    @review = Review.new(pet: @pet)
  end

end
