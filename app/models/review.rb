class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :comment, length: { minimum: 5 }
  validates :rating, inclusion: { in: 1..5 }
end
