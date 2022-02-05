class PetsController < ApplicationController

  def index
    @pets = Pet.all
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

  private

  def pet_params
    params.require(:pet).permit(:address, :name,:description,:category,:price_per_hour, :photo)
  end
end
