class Review < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  belongs_to :pet
end
