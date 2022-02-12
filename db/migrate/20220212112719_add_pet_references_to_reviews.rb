class AddPetReferencesToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :pet, foreign_key: true
  end
end
