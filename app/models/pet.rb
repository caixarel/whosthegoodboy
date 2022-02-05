class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :photo
  validates :name, :address, :description, :category, :price_per_hour,:photo, presence: true

end
