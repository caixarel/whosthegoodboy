class Pet < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  validates :name, :address, :description, :category, :price_per_hour, presence: true
=======
  has_many :offers
>>>>>>> master
end
