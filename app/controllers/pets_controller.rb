class PetsController < ApplicationController

  def index
    @pets = Pet.all.order(:id)

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet })
        }
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pets_params)

    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pets_params
    params.require(:pet).permit(:name, :address, :price_per_hour, :description, :category)
  end

end
