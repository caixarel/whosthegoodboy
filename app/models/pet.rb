class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price_per_hour, presence: true
  validates :photo, presence: true

end
