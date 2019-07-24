class Region < ApplicationRecord
  has_many :deputies, dependent: :destroy
  has_many :deeds, through: :deputies
end
