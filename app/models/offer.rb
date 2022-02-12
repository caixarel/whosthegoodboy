class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :total, numericality: { greater_than: 0, message: "End date not correct!" }
  validates :end_date, presence: true
  validates :starting_date, presence: true
end
