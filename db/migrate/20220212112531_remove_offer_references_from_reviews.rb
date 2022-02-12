class RemoveOfferReferencesFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reviews, :offer
  end
end
