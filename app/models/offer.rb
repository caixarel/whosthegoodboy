class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :total, numericality: { greater_than: 0,message: "End date not correct!" }
end
