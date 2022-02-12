class OffersController < ApplicationController
  before_action :find_pet, except: [:my_offers]

  def index
    @offers = @pet.offers#policy_scope(@pet.offers)
  end

  def new
    if @pet.user == current_user
      redirect_to root_path
    end
    @offer = Offer.new
  end
  def create
    @offer = Offer.new(offer_params)
    add_offer_parameters
    if @offer.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end
  def edit
    @offer = Offer.find(params[:id])

  end
  def update
    @offer = Offer.find(params[:id])
    add_offer_parameters
      if @offer.update(offer_params)
          redirect_to pet_path(@pet)
    else
      render :edit
    end
  end
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to pet_path(@pet)

  end

  def my_offers
    @current_user = current_user
  end

  def accept
    offer = Offer.find(params[:id])
    offer.accepted = true
    if offer.update(accepted: 'accepted')
      redirect_to "/#{current_user.id}/offers_received"
    end
  end

  def reject
    offer = Offer.find(params[:id])
    offer.accepted = true
    if offer.update(accepted: 'rejected')
      redirect_to "/#{current_user.id}/offers_received"
    end
  end

  private

  def find_pet
    @pet = Pet.find(params[:pet_id])
    #authorize @pet
  end

  def add_offer_parameters
    if !params[:offer][:starting_date].empty? && !params[:offer][:end_date].empty?
      start_date = Date.parse params[:offer][:starting_date]
      end_date =Date.parse params[:offer][:end_date]
      price = (end_date- start_date) * @pet.price_per_hour
      @offer.total = price.to_i
      @offer.user = current_user
      @offer.pet = @pet
    end
  end

  def offer_params
    params.require(:offer).permit(:starting_date, :end_date)
  end
end
