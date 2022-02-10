class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :destroy, :show]

  def index
    #@pets = Pet.all.order(:id)
    if params[:query].present?
      @pets = Pet.search_by_name_and_address(params[:query])
    else
      @pets = Pet.all.order(:id)
    end
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        image_url: helpers.asset_url('dog-park.svg'),
        info_window: render_to_string(partial: "info_window", locals: { pet: pet })
        }
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.user == current_user
      if @pet.update(pet_params)
        redirect_to pet_path(@pet)
      else
        render :edit
      end
    end
  end

  def destroy
    if @pet.user == current_user
      @pet.destroy
      redirect_to pets_path
    end
  end

  def show
    @offer = Offer.new
  end
  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :address, :price_per_hour, :description, :category, :photo)
  end
end
