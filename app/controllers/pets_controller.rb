class PetsController < ApplicationController

  def index
    @pets = Pet.all.order(:id)

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
<<<<<<< HEAD
    @pet = Pet.new(pets_params)

=======
    @pet = Pet.new(pet_params)
    @pet.user = current_user
>>>>>>> master
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

<<<<<<< HEAD
  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pets_params
    params.require(:pet).permit(:name, :address, :price_per_hour, :description, :category)
  end

=======
  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.user == current_user
      if @pet.update(pet_params)
        redirect_to pet_path(@pet)
      else
        render :edit
      end
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.user == current_user
      @pet.destroy
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end
  private

  def pet_params
    params.require(:pet).permit(:address, :name,:description,:category,:price_per_hour, :photo)
  end
>>>>>>> master
end
