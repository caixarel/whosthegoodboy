class AddAcceptedToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :accepted, :boolean
  end
end
