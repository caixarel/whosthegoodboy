class OffersController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    #@offers = @pet.offers
  end

  def Show
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @offer = Offer.new
  end
  def create
    @pet = Pet.find(params[:pet_id])
    @offer = Offer.new(offer_params)
    # price = params[]

  end
  def edit
  end
  def update
  end
  def destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:starting_date, :end_date)
  end
end
