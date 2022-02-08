class ProfilesController < ApplicationController
  def profile
    if current_user == User.find(params[:id])
      @user = current_user
      #authorize @user
    else
      redirect_to profile_path(current_user)
      #authorize current_user
    end
  end

  def offers_made
    @user = current_user
    #authorize @user
  end

  def offers_received
    @pets = current_user.pets
    #authorize @pets
  end

end
