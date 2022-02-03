class ProfilesController < ApplicationController
  def index
    @user = current_user
  end

  def offers_made
    @user = current_user
  end

  def offers_received
    @pets = current_user.pets
  end

end
